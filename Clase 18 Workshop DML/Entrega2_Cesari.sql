
/*-------------------- CREACIÓN DE LA BASE DE DATOS --------------------  */

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

-- 

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

/*-------------------- INSERCIÓN DE DATOS  --------------------  */

-- Inserción de datos en cada una de las tablas. 

INSERT INTO usuarios  (nombre, apellido, mail, contrasenia)
VALUES 
("Ariel", "Cesari","ariel.dcesari@gmail.com", "****"),
("Vanina", "Brusco","vani.brusco@gmail.com", "****"),
("Susana", "Montesi","susymontesi@gmail.com", "****"),
("Mariano", "Gonzalez","mariangonzalez@gmail.com", "****"),
("Mauro", "Serpa","mauserpa87@gmail.com", "****"),
("Matias", "Brusco","matiasbrusco@hotmail.com", "****"),
("Daniel", "Zapata","danizapata@yahoo.com.ar", "****"),
("Damian", "Insua","daniinsua21@hotmail.com", "****"),
("Kevin", "Coronel","kcoronel@yahoo.com.ar", "****"),
("Santiago", "Tuama","santituama@hotmail.com", "****")

;

INSERT INTO tipo_producto (id, categoria)
VALUES 
(1, "Cereales"),
(2, "Legumbres"),
(3, "Frutos secos"),
(4, "Mix de autor"),
(5, "Frutas desecadas"),
(6, "Frutos secos"),
(7, "Endulzantes"),
(8, "Chocolate"),
(9, "Dulces y mermeladas"),
(10, "Harinas y algo más"),
(11, "Otros"),
(12, "Semillas"),
(13, "Hiervas e infusiones"),
(14, "Hamburguesas veganas"),
(15, "Condimentos");

INSERT INTO productos  (nombre, precio, descuento, presentacion, descripcion, tipo_id)
VALUES 

-- Cereales
("Copos con azucar", 1900, 20, 7, "Copos de maíz con azucar", 1),
("Copos con azucar", 300, 20, 5, "Copos de maíz con azucar", 1),
("Copos con azucar", 1000, 20, 6, "Copos de maíz con azucar", 1),
("Copos con azucar", 600, 20, 4, "Copos de maíz con azucar", 1),
("Copos con azucar", 300, 20, 5, "Copos de maíz con azucar", 1),
("Copos sin azucar ", 300, 10, 2, "Copos de maíz sin azucar", 1),
("Ositos chocolate", 2400, 10, 7, "Ositos con chocolate", 1),
("Ositos chocolate", 400, 10, 3, "Ositos con chocolate", 1),
("Ositos chocolate", 800, 10, 4, "Ositos con chocolate", 1),
("Ositos chocolate", 1300, 10, 6, "Ositos con chocolate", 1),
("Ositos avena y miel", 2400, 10, 7, "Ositos con avena y miel", 1),
("Ositos avena y miel", 400, 10, 3, "Ositos con avena y miel", 1),
("Ositos avena y miel", 1300, 5, 6, "Ositos con avena y miel", 1),
("Ositos avena y miel", 800, 5, 4, "Ositos con avena y miel", 1),
("Copos sin azucar", 1900, 5, 7, "Copos de maíz sin azucar", 1),
("Copos sin azucar", 300, 5, 3, "Copos de maíz sin azucar", 1),
("Copos sin azucar", 1000, 5, 6, "Copos de maíz sin azucar", 1),
("Copos sin azucar", 600, 5, 4, "Copos de maíz sin azucar", 1),
("Aritos de avena y miel", 2400, 10, 7, "Aritos de avena con miel", 1),
("Aritos de avena y miel", 400, 10, 3, "Aritos de avena con miel", 1),
("Aritos de avena y miel", 1300, 10, 6, "Aritos de avena con miel", 1),
("Aritos de avena y miel", 800, 10, 4, "Aritos de avena con miel", 1),
("Aritos frutales", 2400, 5, 7, "Aritos frutales", 1),
("Aritos frutales", 1300, 5, 6, "Aritos frutales", 1),
("Aritos frutales", 800, 5, 4, "Aritos frutales", 1),
("Aritos frutales", 400, 5, 3, "Aritos frutales", 1),
("Almohaditas sin relleno", 2300, 5, 7, "Almohaditas sin relleno", 1),
("Almohaditas sin relleno", 1300, 5, 6, "Almohaditas  sin relleno", 1),
("Almohaditas sin relleno", 800, 5, 4, "Almohaditas sin relleno", 1),
("Bastoncitos de salvado", 2100, 5, 7, "Batoncitos de salvado. Pura fibra", 1),
("Bastoncitos de salvado", 1200, 5, 6, "Batoncitos de salvado. Pura fibra", 1),
("Bastoncitos de salvado", 700, 5, 4, "Batoncitos de salvado. Pura fibra", 1),
("Bolitas de choco", 2600, 0, 7, "Bolitas de chocolate", 1),
("Bolitas de choco", 400, 0, 3, "Bolitas de chocolate", 1),
("Bolitas de choco", 1400, 0, 6, "Bolitas de chocolate", 1),
("Bolitas de choco", 800, 0, 4, "Bolitas de chocolate", 1),
("Tutuca", 400, 0, 4, "Tutucas azucaradas", 1),
("Almohaditas rellenas", 3300, 5, 7, "Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limón", 1),
("Almohaditas rellenas", 1700, 5, 6, "Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limon", 1),
("Almohaditas rellenas", 1000, 5, 4, "Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limón", 1),
("Almohaditas rellenas", 650, 5, 3, "Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limón", 1),

-- Legumbres
("Lentejas", 1400, 5, 2, "Lentejas naturales", 2),
("Porotos colorados", 800, 5, 6, "Porotos colorados Dark ", 2),
("Porotos alubia", 800, 5, 6, "Porotos alubia ", 2),
("Porotos negros ", 800, 5, 6, "Porotos negros", 2),
("Porotos de Soja", 500, 5, 7, "Porotos de Soja", 2),
("Porotos de Soja", 300, 5, 6, "Porotos de Soja", 2),
("Maíz pisingallo", 900, 5, 7, "Maíz pisingallo", 2),
("Maíz pisingallo", 550, 5, 6, "Maíz pisingallo", 2),
("Garbanzo", 1100, 5, 7, "Garbanzoo", 2),
("Garbanzo", 600, 5, 6, "Garbanzo", 2),

-- Endulzantes 
("Azúcar mascabo", 900, 5, 6, "Azúcar mascabo", 7),
("Azúcar mascabo", 1700, 5, 7, "Azúcar mascabo", 7),
("Miel pura", 1500, 5, 7, "Miel origen Chascomus calidad de exportacion", 7),
("Miel pura", 950, 5, 6, "Miel origen Chascomus calidad de exportacion", 7),
("Miel con carpincho", 450, 5, 8, "Miel 100cc", 7),

-- Chocolate
("Maní con chocolate", 1300, 10, 4, "Maní con chocolate", 8),
("Maní con chocolate", 4000, 10, 7, "Maní con chocolate", 8),
("Maní con chocolate", 700, 10, 3, "Maní con chocolate", 8),
("Maní con chocolate", 2200, 10, 6, "Maní con chocolate", 8),
("Pasas de uva", 1500, 0, 4, "Pasas de uva con chocolate", 8),
("Pasas de uva", 5000, 0, 7, "Pasas de uva con chocolate", 8),
("Pasas de uva", 2650, 0, 6, "Pasas de uva con chocolate", 8),
("Pasas de uva", 700, 0, 3, "Pasas de uva con chocolate", 8),
("Cacao amargo", 600, 0, 3, "Cacao amargo", 8),
("Arandados con chocolate", 2000, 0, 4, "Pasas de Arandanos bañadados en chocolate negro", 8),
("Arandados con chocolate", 3800, 0, 7, "Pasas de Arandanos bañadados en chocolate negro", 8),
("Arandados con chocolate", 950, 0, 3, "Pasas de Arandanos bañadados en chocolate negro", 8),
("Almendras con chocolate", 2100, 0, 4, "Almendras con chocolate", 8),
("Almendras con chocolate", 950, 0, 3, "Almendras con chocolate", 8),
("Almendras con chocolate", 3900, 0, 6, "Almendras con chocolate", 8),
("Chips de choco", 1000, 0, 4, "Chips de cocholate", 8),
("Chips de choco", 3500, 0, 7, "Chips de cocholate", 8),
("Chips de choco", 450, 0, 3, "Chips de cocholate", 8),
("Chips de choco", 1900, 0, 6, "Chips de cocholate", 8),
("Rocklets Arcor", 1200, 0, 4, "Rocklets de Arcor", 8),
("Rocklets Arcor", 750, 0, 3, "Rocklets de Arcor", 8),
("Chocolate Aguila", 850, 0, 8, "Chocolate Águila semi amargo taza x 150 grs", 8),
("Bananitas", 680, 0, 3, "Cereal de banana bañado en chocolate con leche", 8),
("Bananitas", 1600, 0, 4, "Cereal de banana bañado en chocolate con leche", 8),
("Balon", 700, 0, 3, "Balon de cereal bañado con chocolate con leche", 8),
("Balon", 1400, 0, 4, "Balon de cereal bañado con chocolate con leche", 8),
("Balon blanco", 700, 0, 3, "chocolate blanco", 8),
("Balon blanco", 1400, 0, 4, "chocolate blanco", 8),
("Mix Balon blanco y negro", 700, 0, 3, "Mix Balon blanco y negro", 8),
("Mix Balon blanco y negro", 1400, 0, 4, "Mix Balon blanco y negro", 8),

-- Dulces y mermeladas
("Dulce de leche", 2000, 0, 8, "Sin azúcar agregada elaborado con stevia", 9),
("Mermelada Frutos Rojos las Quinas", 2000, 0, 8, "Sin azúcar agregada", 9),
("Arándanos Las Quinas", 2000, 0, 8, "Arándanos Las Quinas", 9),
("Crema de mani Peanat con chocolate", 1300, 0, 8, "Crema de mani Peanat con chocolate", 9),
("Crema de mani peanat Natural", 1300, 0, 8, "Crema de mani peanat Natural", 9),
("Crema de mani linea TRAINING Chocolate", 1400, 0, 8, " Crema de mani linea TRAINING Chocolate", 9),
("Crema mani linea TRAINING", 1400, 0, 8, "Crema mani linea TRAINING", 9),

-- Harinas y algo más
("Harina integral", 400 , 0, 7 , "Harina Integral", 10 ),
("Harian integral", 250 , 0, 4, "Harina Integral", 10 ),
("Harina de coco", 500 , 0, 7 , "Harina de coco", 10 ),
("Harina de coco", 300 , 0, 4 , "Harina de coco", 10 ),
("Harina integral de arroz", 500, 0, 7, "Harina integral de arroz", 10 ),
("Harina integral de arroz", 300 , 0, 4, "Harina integral de arroz", 10 ),
("Harina garbanzo", 500 , 0, 7, "Harina de Garbanzo", 10 ),
("Harina garbanzo", 300 , 0, 4, "Harina de Garbanzo", 10 ),
("Harina de almendra con piel", 3300 , 0, 7, "Harina de almendra con piel", 10 ),
("Harina de almendra con piel", 1800 , 0, 6, "Harina de almendra con piel", 10 ),
("Harina de almendra sin piel", 3300 , 0, 7, "Harina de almendra sin piel", 10 ),
("Harina de almendra sin piel", 1800 , 0, 6, "Harina de almendra sin piel", 10 ),
("Avena instantánea", 1400, 0, 7, "Avena instantánea", 10 ),
("Avena instantánea", 800, 0, 6, "Avena instantánea", 10 ),
("Avena arrollada mediana", 1400, 0, 7, "Grano de avena Mediano", 10 ),
("Avena arrollada mediana", 800, 0, 6, "Grano de avena Mediano", 10 ),
("Soja texturizada grande", 800, 0, 7, "Soja texturizada grande", 10 ),
("Soja texturizada grande", 500, 0, 6, "Soja texturizada grande", 10 ),
("Soja texturizada grande", 300, 0, 4, "Soja texturizada grande", 10 ),
("Arroz Yamaní", 600, 0, 6, "Arroz Yamaní", 10 ),
("Arroz Yamaní", 980, 0, 7, "Arroz Yamaní", 10 ),
("Arroz Integral", 980, 0, 7, "Arroz Integral", 10 ),
("Arroz Integral", 980, 0, 7, "Arroz Integral", 10 ),

-- Otros
("Aceite de coco",2800, 0, 5, "Aceite de coco neutro", 11 ),
("Bicarbonato de sodio", 500, 0, 6, "Bicarbonato de sodio", 11 ),
("Bicarbonato de sodio", 260, 0, 4, "Bicarbonato de sodio", 11 ),
("Polvo para hornear", 600, 0, 3, "Polvo para hornea", 11 ),
("Polvo para hornear", 1300, 0, 4, "Polvo para hornea", 11 ),
("Maca Kallpa", 950, 0, 6, "Maca pura natural", 11 ),
("Yerba organica La buena",  1050, 0, 6, "Yerba secada y ahumada", 11),
("Yerba organica La buena",  1850, 0, 7, "Yerba secada y ahumada", 11),

-- Frutos secos
("Avellanas", 9400, 10, 7, "Avellanas", 3),
("Avellanas", 5000, 10, 6, "Avellanas", 3),
("Avellanas", 4500, 10, 4, "Avellanas", 3),
("Avellanas", 2000, 10, 3, "Avellanas", 3),
("Pistacho tostado y salado", 10500, 0, 7, "Pistacho tostado con cáscara", 3),
("Pistacho tostado y salado", 2700, 0, 4, "Pistacho tostado con cáscara", 3),
("Pistacho tostado y salado", 5300, 0, 6, "Pistacho tostado con cáscara", 3),
("Pistacho tostado y salado", 1200, 0, 3, "Pistacho tostado con cáscara", 3),
("Almendra non pareil", 15500, 0, 7, "Almendra non pareil", 3),
("Almendra non pareil", 1600, 0, 3, "Almendra non pareil", 3),
("Almendra non pareil", 7800, 0, 6, "Almendra non pareil", 3),
("Almendra non pareil", 3950, 0, 4, "Almendra non pareil", 3),
("Almendra guara", 10100, 0, 7, "almenda guara", 3),
("Almendra guara", 1200, 0, 3, "almenda guara", 3),
("Almendra guara", 2600, 0, 4, "almenda guara", 3),
("Almendra guara", 5100, 0, 6, "almenda guara", 3),
("Nueces extra light", 8500, 0, 7, "Nueces extra light", 3),
("Nueces extra light", 1000, 0, 3, "Nueces extra light", 3),
("Nueces extra light", 4350, 0, 4, "Nueces extra light", 3),
("Nueces extra light", 2300, 0, 6, "Nueces extra light", 3),
("Castañas de cajú natural", 13100, 0, 7, "Castañas de cajú natural de Brasil", 3),
("Castañas de cajú natural", 1500, 0, 3, "Castañas de cajú natural de Brasil", 3),
("Castañas de cajú natural", 6700, 0, 4, "Castañas de cajú natural de Brasil", 3),
("Castañas de cajú natural", 3500, 0, 6, "Castañas de cajú natural de Brasil", 3),
("Castañas de cajú tostadas", 13500, 0, 7, "Castañas de cajú  tostadas", 3),
("Castañas de cajú tostadas", 1600, 0, 3, "Castañas de cajú  tostadas", 3),
("Castañas de cajú tostadas", 3600, 0, 4, "Castañas de cajú  tostadas", 3),
("Castañas de cajú tostadas", 6850, 0, 6, "Castañas de cajú  tostadas", 3),
("Maní con sal", 1800, 0, 7, "Maní con sal", 3),
("Maní con sal ", 950, 0, 6, "Maní con sal", 3),
("Maní con sal", 550, 0, 4, "Maní con sal", 3),
("Maní sin sal", 1800, 0, 7, "Maní con sal", 3),
("Maní sin sal", 950, 0, 6, "Maní con sal", 3),
("Maní sin sal", 550, 0, 4, "Maní con sal", 3),

--  Frutas desecadas 
("Chip de banana", 8400, 0, 7, "Chip de banana", 5),
("Chip de banana", 990, 0, 3, "Chip de banana", 5),
("Chip de banana", 4300, 0, 6, "Chip de banana", 5),
("Chip de banana", 2300, 0, 4, "Chip de banana", 5),
("Peras williams mediana", 5000, 5, 7, "Peras williams mediana",5 ),
("Peras williams mediana", 2000, 5, 4, "Peras williams mediana",5 ),
("Peras williams mediana", 3500, 5, 6, "Peras williams mediana",5 ),
("Arandanos rojos", 12400,0,7, "Arandanos rojos",5 ),
("Arandanos rojos", 380,0,3,"Arandanos rojos",5 ),
("Arandanos rojos", 1400,0,6, "Arandanos rojos",5 ),
("Arandanos rojos", 800,0,4, "Arandanos rojos",5 ),
("Pasas de uva Jumbo",2600,0,7, "Pasas de uva Jumbo",5 ),
("Pasas de uva Jumbo",380,0,3, "Pasas de uva Jumbo",5 ),
("Pasas de uva Jumbo",800,0,6, "Pasas de uva Jumbo",5 ),
("Pasas de uva Jumbo",500,0,4, "Pasas de uva Jumbo",5 ),
("Pasas de uva Morenas flame",1400,0,7, "Pasas de uva Morenas flame",5 ),
("Pasas de uva Morenas flame",300,0,3, "Pasas de uva Morenas flame",5 ),
("Pasas de uva Morenas flame",8000,0,6, "Pasas de uva Morenas flame",5 ),
("Pasas de uva Morenas flame",500,0,4, "Pasas de uva Morenas flame",5 ),
("Pasas de uva Morenas Rubias",1400,0,7, "Pasas de uva Morenas Rubias",5 ),
("Pasas de uva Morenas Rubias",300,0,3, "Pasas de uva Morenas Rubias",5 ),
("Pasas de uva Morenas Rubias",8000,0,6, "Pasas de uva Morenas Rubias",5 ),
("Pasas de uva Morenas Rubias",500,0,4, "Pasas de uva Morenas Rubias",5 ),
("Ciruela presidente",3100,0,7, "Ciruela presidente sin carozo",5 ),
("Ciruela presidente",400,0,3, "Ciruela presidente sin carozo",5 ),
("Ciruela presidente",1600,0,6, "Ciruela presidente sin carozo",5 ),
("Ciruela presidente",900,0,4, "Ciruela presidente sin carozo",5 ),
("Ciruela Dagen 88/110",1800,0,7, "Ciruela Dagen 88/110",5 ),
("Ciruela Dagen 88/110",1600,0,6, "Ciruela Dagen 88/110",5 ),
("Ciruela Dagen 88/110",900,0,4, "Ciruela Dagen 88/110",5 ),
("Dátiles",15000,0,7, "Dátiles",5 ),
("Dátiles",4500,0,3, "Dátiles",5 ),
("Dátiles",8500,0,6, "Dátiles",5 ),
("Dátiles",4000,0,4, "Dátiles",5 ),
("Coco rayado",600,0,3,"Coco rayado",5 ),
("Coco rayado",4500,0,7,"Coco rayado",5 ),
("Coco rayado",2350,0,6,"Coco rayado",5 ),
("Coco rayado",1300,0,4,"Coco rayado",5 ),

-- Semillas
("Lino",700,0,7,"Semillas de Lino",12 ),
("Lino",400,0,6,"Semillas de Lino",12 ),
("Lino",300,0,4,"Semillas de Lino",12 ),
("Mostaza",400,0,3,"Mostaza en grano",12 ),
("Quinoa",800,0,3,"Mostaza en grano",12 ),
("Quinoa",1800,0,4,"Mostaza en grano",12 ),
("Girasol",1800,0,7,"Semillas de girasol",12 ),
("Girasol",1000,0,6,"Semillas de girasol",12 ),
("Girasol",600,0,4,"Semillas de girasol",12 ),
("Chía",1200,0,4,"Semillas de chía",12 ),
("Chía",500,0,3,"Semillas de chía",12 ),
("Zapallo",500,0,3,"Semillas Zapallo",12 ),
("Sésano Blanco Integral",2100,0,7,"Sésano Blanco Integral",12 ),
("Sésano Blanco Integral",700,0,6,"Sésano Blanco Integral",12 ),
("Sésano Blanco Integral",1200,0,4,"Sésano Blanco Integral",12 ),
("Sésano Negro",2100,0,7,"Sésano Negro",12 ),
("Sésano Negro",700,0,4,"Sésano Negro",12 ),
("Sésano Negro",1200,0,6,"Sésano Negro",12 ),

-- Mix de autor
("Mix Bernutss",10000,0,7,"Almendras, nueces enteras, arándanos",4 ),
("Mix Bernutss",5100,0,6,"Almendras, nueces enteras, arándanos",4 ),
("Mix Bernutss",2700,0,4,"Almendras, nueces enteras, arándanos",4 ),
("Mix Premium",10400,0,7,"Almendras, nueces, castañas de cajú",4 ),
("Mix Premium",5300,0,6,"Almendras, nueces, castañas de cajú",4 ),
("Mix Premium",2800,0,4,"Almendras, nueces, castañas de cajú",4 ),
("Mix Deluxe",12100,0,7,"Almendras, nueces, castañas de cajú y avellanas",4 ),
("Mix Deluxe",6200,0,6,"Almendras, nueces, castañas de cajú y avellanas",4 ),
("Mix Deluxe",3200,0,4,"Almendras, nueces, castañas de cajú y avellanas",4 ),
("Mix Energia",4700,0,7,"Almendras, nueces, maní, pasas de uva, castañas de caju",4 ),
("Mix Energia",2450,0,6,"Almendras, nueces, maní, pasas de uva, castañas de caju",4 ),
("Mix Energia",1400,0,4,"Almendras, nueces, maní, pasas de uva, castañas de caju",4 ),
("Mix Granola",2500,0,7,"Copos sin azucar ,avena, mix semillas,pasas jumbo, almendras non pareil, nueces enteras, endulzado con miel pura de abejas",4 ),
("Mix Granola",1300,0,6,"Copos sin azucar ,avena, mix semillas,pasas jumbo, almendras non pareil, nueces enteras, endulzado con miel pura de abejas",4 ),
("Mix Granola",800,0,4,"Copos sin azucar ,avena, mix semillas,pasas jumbo, almendras non pareil, nueces enteras, endulzado con miel pura de abejas",4 ),
("Mix Desayuno",1600,0,7,"Copos sin azúcar, avena instantánea, bastoncitos de salvado, pasas de uva, semillas, chips banana",4 ),
("Mix Desayuno",500,0,4,"Copos sin azúcar, avena instantánea, bastoncitos de salvado, pasas de uva, semillas, chips banana",4 ),
("Mix Desayuno",900,0,6,"Copos sin azúcar, avena instantánea, bastoncitos de salvado, pasas de uva, semillas, chips banana",4 ),
("Mix Classic",6200,0,7,"Almendras, nueces, maní",4 ),
("Mix Classic",3200,0,6,"Almendras, nueces, maní",4 ),
("Mix Classic",1700,0,4,"Almendras, nueces, maní",4 ),
("Mix Running",6900,0,7,"Almendras, nueces, maní, chips de banana",4 ),
("Mix Running",3600,0,6,"Almendras, nueces, maní, chips de banana",4 ),
("Mix Running",1900,0,4,"Almendras, nueces, maní, chips de banana",4 ),
("Mix Semillas",1200,0,7,"Chía, lino, centeno, girasol",4 ),
("Mix Semillas",700,0,6,"Chía, lino, centeno, girasol",4 ),
("Mix Semillas",450,0,4,"Chía, lino, centeno, girasol",4 ),

-- Hierbas e infusiones
("AMARGON (Diente de leon)",110,0,2,"HIERBAS DEL OASIS",13 ),
("AMARGON (Diente de leon)",200,0,3,"HIERBAS DEL OASIS",13 ),
("Ajenjo especial",180,0,3,"Ajenjo especial",13 ),
("Ajenjo especial",100,0,2,"Ajenjo especial",13 ),
("BOLDO",200,0,2,"BOLDO Hojas",13 ),
("Ajenjo especial",200,0,2,"Ajenjo especial en hojas",13 ),
("Ajenjo especial",100,0,1,"Ajenjo especial en hojas",13 ),
("Boldo",200,0,2,"Boldo en hojas",13 ),
("Boldo",100,0,1,"Boldo en hojas",13 ),
("Cedron",200,0,2,"Cedron en hojas",13 ),
("Cedron",100,0,1,"Cedron en hojas",13 ),

-- Hamburguesas veganas
("Verde",1200,6,8," Verde pack x 4 unidades de 120gr c/u, Espinaca, Arvejas, Pesto y semillas de girasol (base de Arroz yamani integral",14 ),
("Blanco",850,6,8," Verde pack x 4 unidades de 120gr c/u. Batata, verdeo, hongo de pino, poroto aduki y jengibre",14 ),
("Rojo",850,6,8," Verde pack x 4 unidades de 120gr c/u.Remolacha, lentejas, mijo y tomates confitados",14 ),
("Amarillo",850,6,8," Verde pack x 4 unidades de 120gr c/u.Calabaza, Cebolla caramelizada, Zanahoria, Garbanzos, curri y azafrán",14 ),

-- Condimentos 
("Orégano",300,0,3,"Orégano",15),
("Orégano",170,0,2,"Orégano",15),
("Provenzal",500,0,3,"Provenzal Primera calidad ",15),
("Provenzal",300,0,2,"Provenzal Primera calidad ",15),
("Ají Molido",250,0,3,"Ají Molido",15),
("Ají Molido",150,0,2,"Ají Molido",15),
("Condimiento para pizza",250,0,3,"Condimiento para pizza",15),
("Condimiento para pizza",150,0,2,"Condimiento para pizza",15),
("Canela Molida",250,0,3,"Canela Molida",15),
("Canela Molida",150,0,2,"Canela Molida",15),
("Comino molido",150,0,3,"Comino molido",15),
("Comino molido",250,0,2,"Comino molido",15),
("Tomillo",250,0,3,"Tomillo",15),
("Tomillo",150,0,2,"Tomillo",15),
("Cúrcuma",200,0,3,"Cúrcuma",15),
("Cúrcuma",130,0,2,"Cúrcuma",15),
("Pimentón ahumado",200,0,3,"Pimentón ahumado",15),
("Pimentón ahumado",130,0,2,"Pimentón ahumado",15),
("Pimentón",200,0,3,"Pimentón",15),
("Pimentón",130,0,2,"Pimentón",15),
("Ajo en polvo",200,0,3,"Ajo en polvo",15),
("Ajo en polvo",150,0,2,"Ajo en polvo",15),
("Pimienta blanca molida",250,0,3,"Pimienta blanca molida",15),
("Pimienta blanca molida",150,0,2,"Pimienta blanca molida",15),
("Curry",250,0,3,"Curry",15),
("Curry",150,0,2,"Curry",15),
("Jengibre en polvo",300,0,3,"Jengibre en polvo",15),
("Jengibre en polvo",170,0,2,"Jengibre en polvo",15),
("Sal Marina",150,0,6,"Sal Marina",15);


INSERT INTO presentacion  (id, presentacion)
VALUES 
(1, "20 gramos"),
(2, "50 gramos"),
(3, "100 gramos"),
(4, "250 gramos"),
(5, "360 gramos"),
(6, "500 gramos"),
(7, "1000 gramos"),
(8, "Unidad");

INSERT INTO presentacion_producto  (id, producto_id, presentacion_id)
VALUES 
(1, 1, 1);

INSERT INTO carrito  (id, detalle, precio_final, fecha_entrega, forma_entrega, pedido_usuario)
VALUES 
(1, "Detalle de la compra", 100, "2022-02-02","Retiro en sucursal", 1);

INSERT INTO tipo_usuario  (id, tipo, usuario_id)
VALUES 
(1, "Administrador", 1),
(2, "Invitado", 2),
(3, "Registrado", 3);

INSERT INTO pedido_final  (id, carrito_id, producto_id)
VALUES 
(1, 1, 1);

-- Inserto datos en cada uno de los campos: 
INSERT INTO envios  (id, forma_entrega, detalle_entrega, domicilio_entrega, carrito_id)
VALUES 
(1, "Retiro por domicilio", "Se retira por domicilio del vendedor", "Comandante Franco 253 entre Maipu y Ayacucho. Bernal", 1),
(2, "Envio a domicilio", "Opcion Martes. Horario de entrega entre 9 a 19 horas", "Quilmes - Bernal - Don Bosco consultar por otra zona", 1),
(3, "Envio a domicilio", "Opcion Jueves. Horario de entrega entre 9 a 19 horas", "Quilmes - Bernal - Don Bosco consultar por otra zona", 1),
(4, "Envio a domicilio", "Opcion Sábado. Horario de entrega entre 14 a 18 horas", "Quilmes - Bernal - Don bosco - Wilde", 1),
(5, "Envio a domicilio", "Opcion Sábado. Compra mínima $3.000.-", "Florencio Varela	 - Berazategui - Ezpeleta", 1);

/*-------------------- CREACIÓN DE VISTAS  --------------------  */


-- Creación de primera Vista:  Traemos todos los usuarios que usen GMAIL como correo electronico.

   CREATE or replace view usuarios_email AS
    (
    SELECT nombre as "Nombre de Usuario", apellido as "Apellido del usuario",  mail as "Corre electronico con dominio GMAIL"
	from usuarios
	where lower(mail) like '%gmail%'
    );
    
-- Creación de segunda Vista: Traemos la cantidad de productos con descuento

   CREATE or replace view productos_con_descuento AS
    (
    select count(nombre) as "Cantidad de productos con descuento" from productos 
    where descuento > 0
    
    );
    
-- Creación de tercera  Vista:  Traemos los usuarios que son administradores.
  
    CREATE or replace view usuario_admin AS
    (
	select usuarios.id, concat( usuarios.nombre, "  ",  usuarios.apellido ) as "Usuario", tipo_usuario.tipo
    from usuarios
    inner join tipo_usuario on usuarios.id = tipo_usuario.usuario_id
    where tipo_usuario.tipo like "Administrador"
    );
    
-- Creación de cuarta vista : Traemos el precio máximo para cada producto , agrupado por nombre.
 CREATE or replace view precio_maximo AS
    (
SELECT distinct nombre, MAX(precio) AS precio_maximo
FROM productos
GROUP BY nombre
);

-- Creación de quinta vista :  Traemos todos los productos con categoria frutos secos. Ordenado del mayor al menor precio.
 CREATE or replace view frutos_secos AS
    (
select productos.nombre as "Nombre del Producto",  tipo_producto.categoria as "Tipo de Producto", productos.descripcion, productos.precio as "Precio del Producto"
from productos 
inner join tipo_producto  on  productos.tipo_id  = tipo_producto.id
where tipo_producto.categoria like "%Frutos secos%"
order by precio desc
);

/*-------------------- FUNCIONES   --------------------  */


-- FUNCION 1 Aumentar todos los productos  sin descuento  en x%   (ejemplo precio * 1.21) y Devolver la SUMA total. 

select distinct nombre,  precio  * 1.21 as "Precio con aumento", categoria
from productos
inner join tipo_producto on  productos.tipo_id = tipo_producto.id
where descuento = 0
;

-- Creo la función 
drop function if exists  fn_precio_aumentado ;

 delimiter $$ 
 create function  fn_precio_aumentado (p_aumento decimal(4,2) ) 
                                 
 returns  int 
 deterministic 
 begin
 
 declare v_precio_con_aumento int ;
 set v_precio_con_aumento =  
      ( select distinct  SUM(precio  * p_aumento) as "Precio con aumento"
        from productos
	    inner join tipo_producto on  productos.tipo_id = tipo_producto.id
	    where descuento = 0
	   );
	
return  v_precio_con_aumento;   
end$$ 
delimiter ;
 
 
 select fn_precio_aumentado(1.21) as "Suma de precios con el aumento";

-- FUNCION 2 : Contar cantidad de productos según categorias:

select count(nombre) as "Cantidad de Productos por categoria consultada"
from productos
inner join tipo_producto on productos.tipo_id = tipo_producto.id
where categoria like "%Cereales%";

-- Creo la función 
drop function if exists  fn_cantidad_productos_por_categoria;

 delimiter $$ 
 create function  fn_cantidad_productos_por_categoria (p_categoria varchar(60) ) 
                                 
 returns  varchar(60) 
 deterministic 
 begin
 
 declare v_categoria varchar(60)  ;
 set v_categoria =  
      ( select count(nombre) as "Cantidad de Productos por categoria consultada"
       from productos
	    inner join tipo_producto on productos.tipo_id = tipo_producto.id
	    where tipo_producto.categoria like p_categoria
	   );
	
return  v_categoria;   
end$$ 
delimiter ;
 
 -- OPCIONES PARA INVOCAR A LA FUNCION
 -- Cereales
-- Legumbres
-- Frutos secos
-- Mix de autor
-- Frutas desecadas
-- Frutos secos
-- Endulzantes
-- Chocolate
-- Dulces y mermeladas"
-- Harinas y algo más
-- Otros
-- Semillas
-- Hiervas e infusiones
-- Hamburguesas veganas
-- Condimentos

 select fn_cantidad_productos_por_categoria("%Condimentos%") as "Cantidad de productos";
 
 /*-------------------- STORED    --------------------  */
 
 /* CONSIGNA 1:  El primer S.P debe permitir indicar a traves de un parametro el campo de ordenamiento
 de una tabla y mediante un segundo parametro, si el orden es descendente o ascendente. */

-- Creación del S.P. Declaro dos parametros.

DROP PROCEDURE IF EXISTS bernutss_db.SP_listar_productos;
DELIMITER $$
CREATE PROCEDURE  bernutss_db.SP_listar_productos(IN P_campo_columna VARCHAR(50),
												 IN P_ordenamiento VARCHAR(10) 
												 )
BEGIN
-- Seteo dinámicamente la consulta usando CONCAT. Esta incluye el nombre de las columnas y el tipo de ordenamiento en base a los parametros.
 SET @sql_query = CONCAT('SELECT id, nombre, precio FROM bernutss_db.productos ORDER BY ', P_campo_columna, ' ', P_ordenamiento) ;
 
 -- Preparo la consulta y le asigno el identificador : @sql_query
    PREPARE consulta FROM @sql_query;
 -- Ejecuto la consulta preparada en el paso anterior.   
    EXECUTE consulta;
  -- Libero la consulta ya preparada.
    DEALLOCATE PREPARE consulta;
END $$
DELIMITER ;

-- Establezco el valor de los parametros 
SET @P_campo_columna = 'precio';
SET @P_ordenamiento = 'ASC';

-- Llamada al procedimiento.
CALL bernutss_db.SP_listar_productos(@P_campo_columna, @P_ordenamiento);


/* CONSIGNA 2: 
 *  Creo un S.P que permita insertar registros en una tabla .*/
										
-- Creación del S.P. Declaro los parámetros .

DROP PROCEDURE IF EXISTS bernutss_db.SP_agregar_registro;

DELIMITER $$
CREATE PROCEDURE  bernutss_db.SP_agregar_registro( p_nombre VARCHAR(255),
															p_apellido VARCHAR(255),
															p_mail VARCHAR(255),
															p_contrasenia VARCHAR(255))
BEGIN
 -- Inserto un nuevo registro
    INSERT INTO bernutss_db.usuarios (nombre, apellido, mail, contrasenia)
    VALUES (p_nombre, p_apellido, p_mail, p_contrasenia);

   
END $$
DELIMITER ;

-- Realizo el llamado 
CALL bernutss_db.SP_agregar_registro('Javier', 'Milei', 'el_leon@gmail.com', '****');

-- Realizo una consulta para cheqeuar el resultado final.
SELECT * FROM bernutss_db.usuarios;

 /*-------------------- TRIGGERS    --------------------  */

-- Crear la tabla LOG_AUDITORIA
DROP TABLE IF EXISTS bernutss_db.LOG_AUDITORIA;
CREATE TABLE IF NOT EXISTS bernutss_db.LOG_AUDITORIA 
(
    ID_LOG INT AUTO_INCREMENT,
    NOMBRE_DE_ACCION VARCHAR(10),
    NOMBRE_TABLA VARCHAR(50),
    USUARIO VARCHAR(100),
    FECHA_UPD_INS_DEL DATE,
    PRIMARY KEY (ID_LOG)
);


-- Crear el trigger TRG_LOG_tipo_usuario
DROP TRIGGER IF EXISTS TRG_LOG_usuarios;
DELIMITER //
CREATE TRIGGER TRG_LOG_usuarios AFTER INSERT ON bernutss_db.usuarios
FOR EACH ROW 
BEGIN
    INSERT INTO bernutss_db.LOG_AUDITORIA (NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
    VALUES ('INSERT', 'usuarios', CURRENT_USER(), NOW());
END//
DELIMITER ;

-- Crear la tabla LOG_AUDITORIA_2
DROP TABLE IF EXISTS bernutss_db.LOG_AUDITORIA_2;
CREATE TABLE IF NOT EXISTS bernutss_db.LOG_AUDITORIA_2 
(
    ID_LOG INT AUTO_INCREMENT,
    PROVINCIA VARCHAR(50) DEFAULT NULL,
    ID_PROVINCIA INT NOT NULL,
    NOMBRE_DE_ACCION VARCHAR(10),
    NOMBRE_TABLA VARCHAR(50),
    USUARIO VARCHAR(100),
    FECHA_UPD_INS_DEL DATE,
    PRIMARY KEY (ID_LOG)
);

-- Crear el trigger TRG_LOG_tipo_usuario_2
DROP TRIGGER IF EXISTS TRG_LOG_tipo_usuario_2;
DELIMITER //
CREATE TRIGGER TRG_LOG_usuarios_2 AFTER INSERT ON bernutss_db.usuarios
FOR EACH ROW 
BEGIN
    INSERT INTO bernutss_db.LOG_AUDITORIA_2 (PROVINCIA, ID_PROVINCIA, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
    VALUES (NULL, NEW.id, 'INSERT', 'usuarios', CURRENT_USER(), NOW());
END//
DELIMITER ;

-- Mostrar el contenido de las tablas LOG_AUDITORIA y LOG_AUDITORIA_2
SELECT * FROM bernutss_db.LOG_AUDITORIA;
SELECT * FROM bernutss_db.LOG_AUDITORIA_2;

INSERT INTO usuarios (nombre, apellido, mail, contrasenia)
VALUES ("Leandro", "Gonzalez","leandro@hotmail.com", "****") ;






