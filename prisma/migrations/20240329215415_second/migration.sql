/*
  Warnings:

  - You are about to alter the column `correo` on the `Usuario` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(200)`.
  - You are about to alter the column `password` on the `Usuario` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(32)`.

*/
-- AlterTable
ALTER TABLE "Usuario" ALTER COLUMN "correo" SET DATA TYPE VARCHAR(200),
ALTER COLUMN "password" SET DATA TYPE VARCHAR(32);
