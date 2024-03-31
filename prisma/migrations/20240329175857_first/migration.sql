-- CreateTable
CREATE TABLE "Pais" (
    "id_pais" SERIAL NOT NULL,
    "pais" TEXT NOT NULL,

    CONSTRAINT "Pais_pkey" PRIMARY KEY ("id_pais")
);

-- CreateTable
CREATE TABLE "Estado" (
    "id_estado" SERIAL NOT NULL,
    "estado" TEXT NOT NULL,
    "id_pais" INTEGER NOT NULL,

    CONSTRAINT "Estado_pkey" PRIMARY KEY ("id_estado")
);

-- CreateTable
CREATE TABLE "Ciudad" (
    "id_ciudad" SERIAL NOT NULL,
    "ciudad" TEXT NOT NULL,
    "id_estado" INTEGER NOT NULL,

    CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("id_ciudad")
);

-- CreateTable
CREATE TABLE "Direccion" (
    "id_direccion" SERIAL NOT NULL,
    "direccion" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "id_ciudad" INTEGER NOT NULL,

    CONSTRAINT "Direccion_pkey" PRIMARY KEY ("id_direccion")
);

-- CreateTable
CREATE TABLE "Rol" (
    "id_rol" SERIAL NOT NULL,
    "rol" TEXT NOT NULL,

    CONSTRAINT "Rol_pkey" PRIMARY KEY ("id_rol")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id_usuario" SERIAL NOT NULL,
    "correo" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "id_rol" INTEGER NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_usuario")
);

-- CreateTable
CREATE TABLE "Cliente" (
    "id_cliente" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido_paterno" TEXT NOT NULL,
    "apellido_materno" TEXT,
    "telefono" TEXT,
    "fecha_nacimiento" TIMESTAMP(3) NOT NULL,
    "id_usuario" INTEGER NOT NULL,
    "id_direccion" INTEGER NOT NULL,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("id_cliente")
);

-- CreateTable
CREATE TABLE "Proveedor" (
    "id_proveedor" SERIAL NOT NULL,
    "proveedor" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "correo" TEXT NOT NULL,

    CONSTRAINT "Proveedor_pkey" PRIMARY KEY ("id_proveedor")
);

-- CreateTable
CREATE TABLE "Categoria" (
    "id_categoria" SERIAL NOT NULL,
    "categoria" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("id_categoria")
);

-- CreateTable
CREATE TABLE "Producto" (
    "id_producto" SERIAL NOT NULL,
    "producto" TEXT NOT NULL,
    "precio" DOUBLE PRECISION NOT NULL,
    "almacen" INTEGER NOT NULL,
    "id_proveedor" INTEGER NOT NULL,
    "id_categoria" INTEGER NOT NULL,

    CONSTRAINT "Producto_pkey" PRIMARY KEY ("id_producto")
);

-- CreateTable
CREATE TABLE "CuponDisponible" (
    "id_cupon_d" SERIAL NOT NULL,
    "codigo" TEXT NOT NULL,
    "porcentaje_descuento" DOUBLE PRECISION NOT NULL,
    "fecha_inicio" TIMESTAMP(3) NOT NULL,
    "fecha_fin" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CuponDisponible_pkey" PRIMARY KEY ("id_cupon_d")
);

-- CreateTable
CREATE TABLE "CuponUsado" (
    "id_cupon_usado" SERIAL NOT NULL,
    "id_cupon_d" INTEGER NOT NULL,
    "id_usuario" INTEGER NOT NULL,
    "fecha_usado" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CuponUsado_pkey" PRIMARY KEY ("id_cupon_usado")
);

-- CreateTable
CREATE TABLE "Carrito" (
    "id_carrito" SERIAL NOT NULL,
    "id_usuario" INTEGER NOT NULL,
    "id_producto" INTEGER NOT NULL,

    CONSTRAINT "Carrito_pkey" PRIMARY KEY ("id_carrito")
);

-- AddForeignKey
ALTER TABLE "Estado" ADD CONSTRAINT "Estado_id_pais_fkey" FOREIGN KEY ("id_pais") REFERENCES "Pais"("id_pais") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ciudad" ADD CONSTRAINT "Ciudad_id_estado_fkey" FOREIGN KEY ("id_estado") REFERENCES "Estado"("id_estado") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Direccion" ADD CONSTRAINT "Direccion_id_ciudad_fkey" FOREIGN KEY ("id_ciudad") REFERENCES "Ciudad"("id_ciudad") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_id_rol_fkey" FOREIGN KEY ("id_rol") REFERENCES "Rol"("id_rol") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_id_direccion_fkey" FOREIGN KEY ("id_direccion") REFERENCES "Direccion"("id_direccion") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Producto" ADD CONSTRAINT "Producto_id_proveedor_fkey" FOREIGN KEY ("id_proveedor") REFERENCES "Proveedor"("id_proveedor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Producto" ADD CONSTRAINT "Producto_id_categoria_fkey" FOREIGN KEY ("id_categoria") REFERENCES "Categoria"("id_categoria") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CuponUsado" ADD CONSTRAINT "CuponUsado_id_cupon_d_fkey" FOREIGN KEY ("id_cupon_d") REFERENCES "CuponDisponible"("id_cupon_d") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CuponUsado" ADD CONSTRAINT "CuponUsado_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Carrito" ADD CONSTRAINT "Carrito_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Carrito" ADD CONSTRAINT "Carrito_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id_producto") ON DELETE RESTRICT ON UPDATE CASCADE;
