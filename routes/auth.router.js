import { Router } from "express";
import { prisma } from "../db/connection.js";
import jsonwebtoken from 'jsonwebtoken';
import { config } from "dotenv";
import md5 from 'md5';


const jwt = jsonwebtoken;
const authRoutes = Router();

config();

authRoutes.post('/auth', async (req, res) => {
    const { correo, password } = req.body;
    const usuario = await prisma.usuario.findFirst({
        where: {
            AND: [
                { correo: correo },
                { password: md5(password) }
            ]
        }
    });
    if (usuario) {
        const accessToken = generarAccessToken(correo);

        res.header('authorization', accessToken).json({
            message: "Usuario validado",
            token: accessToken
        })
    } else {
        res.status(404).json({ error: 'Usuario no encontrado...' });
    }
});

function generarAccessToken(objects) {
    return jwt.sign(objects, process.env.SECRET)
}

function validateToken(req, res, next) {
    const accessToken = req.headers['authorization'];
    // console.log('TOKEN HEADER: ' + accessToken);
    if (!accessToken) return res.status(401).send('Access denied!, no Header')

    jwt.verify(accessToken, process.env.SECRET, (err, user) => {
        if (err) {
            console.error('Token Verification Error:', err);
            return res.status(401).send('Access denied, token incorrect')
        }
        req.user = user;
        next();
    })
}


export { authRoutes, validateToken };
