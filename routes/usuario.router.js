import { Router } from "express";
import { prisma } from "../db/connection.js";

const router = Router();

router.get('/usuarios', async (req, res) => {
    const usuarios = await prisma.usuario.findMany();
    res.json(usuarios);
});

router.get('/usuarios/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const usuario = await prisma.usuario.findUnique({
            where: {
                id_usuario: parseInt(id)
            }
        });
        if (usuario) {
            res.json(usuario);
        } else {
            res.status(404).json({ error: 'Usuario no encontrado' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Error al buscar el usuario' });
    }
});


export default router;
