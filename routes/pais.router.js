import { Router } from "express";
import { prisma } from "../db/connection.js";

const router = Router();

router.get('/paises', async (req, res) => {
    const paises = await prisma.pais.findMany();
    res.json(paises);
});

router.post('/paises', async (req, res) => {
    const newPais = await prisma.pais.create({
        data: req.body,
    });
    res.json(newPais);
});

router.put('/paises/:id', async (req, res) => {
    const { id } = req.params;
    const { nombre } = req.body;

    const updatedPais = await prisma.pais.update({
        where: {
            id: parseInt(id),
        },
        data: {
            nombre,
        },
    });
    res.json(updatedPais);
});

router.delete('/paises/:id', async (req, res) => {
    const { id } = req.params;

    const deletedPais = await prisma.pais.delete({
        where: {
            id: parseInt(id),
        },
    });
    res.json(deletedPais);
});

export default router;
