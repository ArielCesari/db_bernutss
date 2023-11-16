
-- Si es que existe, elimino la base de datos.Por último, creo y uso la misma.
DROP DATABASE IF EXISTS `bernutss_db`;
CREATE DATABASE `bernutss_db`;
USE `bernutss_db`;

-- Creo la tabla usuarios. La misma tendrá una columna llamada "id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS usuarios;
CREATE TABLE IF NOT EXISTS  usuarios (
   `id` INT AUTO_INCREMENT COMMENT 'CLAVE PRIMARIA' ,
   `nombre` VARCHAR(150) NOT NULL COMMENT 'NOMBRE DEL USUARIO',
   `apellido` VARCHAR(150) NOT NULL COMMENT 'APELLIDO DEL USUARIO',
   `mail` VARCHAR(150) NOT NULL COMMENT 'CORREO ELECTRONICO DEL USUARIO ',
   `contrasenia` VARCHAR(150) NOT NULL COMMENT 'CONTRASEÑA DEL USUARIO',
   `imagen` BLOB COMMENT 'IMAGEN DE PERFIL',
   PRIMARY KEY (`id`)
);


-- Creo la tabla "productos". La misma tendrá una columna llamada "id" auto incremental(PK).Detallo los tipos de datos. Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS productos;
CREATE TABLE IF NOT EXISTS  productos (
   `id` INT AUTO_INCREMENT COMMENT 'CLAVE PRIMARIA',
   `nombre` VARCHAR(150) NOT NULL COMMENT 'NOMBRE DEL PRODUCTO',
   `precio` INT NOT NULL COMMENT 'PRECIO DEL PRODUCTO',
   `descuento` INT COMMENT 'DESCUENTO DEL PRODUCTO',
   `presentacion` INT COMMENT 'PRESENTACION EN GRAMOS',
   `descripcion` TEXT NOT NULL COMMENT 'BREVE DESCRIPCION DEL PRODUCTO',
   `tipo_id` INT NOT NULL COMMENT 'CLAVE FORANEA TIPO DE PRODUCTO',
   `imagen` BLOB COMMENT 'IMAGEN DEL PRODUCTO',
   PRIMARY KEY (`id`)
);



-- Creo la tabla tipo_Producto. La misma tendrá una columna llamada "id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS tipo_producto;
CREATE TABLE IF NOT EXISTS  tipo_producto (
   `id` INT  COMMENT 'CLAVE PRIMARIA',
   `categoria` VARCHAR(150) NOT NULL COMMENT 'CATEOGORIA DEL TIPO DEL PRODUCTO',
   PRIMARY KEY (`id`)
);

 -- Creo la tabla "presentacion". La misma tendrá una columna llamada"id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS presentacion;
CREATE TABLE IF NOT EXISTS presentacion (
   `id` INT COMMENT 'CLAVE PRIMARIA',
   `presentacion` VARCHAR(150) NOT NULL COMMENT 'PRESENTACION SEGUN EL PESO EN GRAMOS',
   PRIMARY KEY (`id`)
);

-- Creo la tabla "presentacion_producto". La misma tendrá una columna llamada"id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS presentacion_producto;
CREATE TABLE IF NOT EXISTS presentacion_producto (
   `id` INT AUTO_INCREMENT COMMENT 'CLAVE PRIMARIA',
   `producto_id` INT NOT NULL COMMENT 'CLAVE FORANEA PRODUCTO ',
   `presentacion_id` INT NOT NULL COMMENT ' CLAVE FORANEA PRESENTACION',
   PRIMARY KEY (`id`)
);

 -- Creo la tabla "carrito". La misma tendrá una columna llamada"id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS carrito;
CREATE TABLE IF NOT EXISTS  carrito (
   `id` INT AUTO_INCREMENT COMMENT 'CLAVE PRIMARIA', 
   `detalle` TEXT NOT NULL COMMENT ' DETALLE DEL PEDIDO',
   `precio_final` INT NOT NULL COMMENT 'PRECIO FINA DEL PEDIDO',
   `fecha_entrega` DATETIME NOT NULL COMMENT 'FECHA DE ENTREGA DEL PEDIDO',
   `forma_entrega` VARCHAR(255) NOT NULL COMMENT 'FORMA DE ENTREGA DEL PEDIDO',
   `pedido_usuario` INT NOT NULL COMMENT 'CLAVE FORANEA PEDIDO SEGUN USUARIO',
   PRIMARY KEY (`id`)
);

-- Creo la tabla "tipoUsuario". La misma tendrá una columna llamada "id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS tipo_usuario ;
CREATE TABLE IF NOT EXISTS  tipo_usuario (
   `id` INT AUTO_INCREMENT COMMENT 'CLAVE PRIMARIA',
   `tipo` VARCHAR(100) NOT NULL COMMENT 'TIPO DE USUARIO',
   `usuario_id` INT NOT NULL COMMENT 'CLAVE FORANEA TIPO DE USUARIO',
   PRIMARY KEY (`id`)
);



-- Creo la tabla "pedidoFinal". La misma tendrá una columna llamada"id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
-- Se crea a modo de "tabla pivot". Para lograr generar una relación de muchos a muchos entre las tablas carrito y productos.
DROP TABLE IF EXISTS pedido_final;
CREATE TABLE IF NOT EXISTS  pedido_final (
   `id` INT AUTO_INCREMENT COMMENT 'CLAVE PRIMARIA',
   `carrito_id` INT NOT NULL COMMENT ' CLAVE FORANEA CARRITO',
   `producto_id` INT NOT NULL COMMENT 'CLAVE FORANEA PRODUCTO',
   PRIMARY KEY (`id`)
);

-- Creo la tabla "envios". La misma tendrá una columna llamada"id" auto incremental(PK).Detallo los tipos de datos.Aclaro cuales deben ser "Not Null"
DROP TABLE IF EXISTS envios ;
CREATE TABLE IF NOT EXISTS  envios (
   `id` INT AUTO_INCREMENT COMMENT 'CLAVE PRIMARIA',
   `forma_entrega` VARCHAR(100) NOT NULL COMMENT '',
   `detalle_entrega` VARCHAR(200) NOT NULL COMMENT '',
   `domicilio_entrega` VARCHAR(200) NOT NULL COMMENT '',
   `carrito_id` INT NOT NULL COMMENT '',
    PRIMARY KEY (`id`)
);

-- Agrego una restricción de clave foránea a la tabla productos, que asegura que los valores en la columna tipoId de esa tabla coincidan con los valores en la columna id de la tabla tipoproducto, lo que establece una relación de muchos a uno y de uno a muchos.
ALTER TABLE `productos` ADD CONSTRAINT `FK_tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_producto`(`id`);

-- Agrego una restricción de clave foránea a la tabla presentancion_producto, que asegura que los valores en la columna producto_id de esa tabla coincidan con los valores en la columna id de la tabla productos.
ALTER TABLE `presentacion_producto` ADD CONSTRAINT `FK_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos`(`id`);

-- Agrego una restricción de clave foránea a la tabla presentancion_producto, que asegura que los valores en la columna presentacion_id de esa tabla coincidan con los valores en la columna id de la tabla presentacion.
ALTER TABLE `presentacion_producto` ADD CONSTRAINT `FK_presentacion_id` FOREIGN KEY (`presentacion_id`) REFERENCES `presentacion`(`id`)  ;

-- Agrego una restricción de clave foránea a la tabla carrito, que asegura que los valores en la columna pedido_usuario de esa tabla coincidan con los valores en la columna id de la tabla usuarios, lo que establece una relación de muchos a uno y de uno a muchos.
ALTER TABLE `carrito` ADD CONSTRAINT `FK_pedido_usuario` FOREIGN KEY (`pedido_usuario`) REFERENCES `usuarios`(`id`)  ;

-- Agrego una restricción de clave foránea a la tabla tipo_usuario, que asegura que los valores en la columna usuario_id de esa tabla coincidan con los valores en la columna id de la tabla usuarios, lo que establece una relación de muchos a uno y de uno a muchos.
ALTER TABLE `tipo_usuario` ADD CONSTRAINT `FK_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`id`)  ;

-- Agrego una restricción de clave foránea a la tabla pedido_final, que asegura que los valores en la columna carrito_id de esa tabla coincidan con los valores en la columna id de la tabla carrito. Con esto, se logra establecer una relación de muchos a muchos.
ALTER TABLE `pedido_final` ADD CONSTRAINT `FK_carrito` FOREIGN KEY (`carrito_id`) REFERENCES `carrito`(`id`)  ;

-- Agrego una  nueva restricción de clave foránea a la tabla pedido_final, que asegura que los valores en la columna productos_id de esa tabla coincidan con los valores en la columna id de la tabla productos. Con esto, se logra establecer una relación de muchos a muchos.
ALTER TABLE `pedido_final` ADD CONSTRAINT `FK_productos_id` FOREIGN KEY (`producto_id`) REFERENCES `productos`(`id`)  ;

-- Agrego una restricción de clave foránea a la tabla envios, que asegura que los valores en la columna carrito_id de esa tabla coincidan con los valores en la columna id de la tabla carrito. 
ALTER TABLE `envios` ADD CONSTRAINT `FK_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `carrito`(`id`)  ;



