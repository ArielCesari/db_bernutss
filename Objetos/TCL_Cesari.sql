/*-------------------- SETENCIAS DEL LENGUAJE TCL  --------------------  */

/* Consigna: Realizar una serie de modificaciones en los registros. Controladas por transacciones. */ 

USE bernutss_db;

START TRANSACTION;

SET @@autocommit = 0;
SELECT @@autocommit;

-- Elimino productos que no tengan descuentos
DELETE FROM productos  where descuento = 0 ;

-- ROLLBACK;
-- COMMIT;

SELECT * FROM productos;

-- Agrego productos a modo de prueba. Establezco SAVEPOINTS

INSERT INTO productos  (nombre, precio, descripcion, tipo_id)
VALUES 
("Producto de prueba 1", 0,"", 14 ),
("Producto de prueba 2", 0,"", 14 ),
("Producto de prueba 3", 0,"", 14),
("Producto de prueba 4", 0,"", 14 );
SAVEPOINT SP1 ;

INSERT INTO productos  (nombre, precio, descripcion, tipo_id)
VALUES 
("Producto de prueba 5", 0,"", 14 ),
("Producto de prueba 6", 0,"", 14 ),
("Producto de prueba 7", 0,"", 14),
("Producto de prueba 8", 0,"", 14 );
SAVEPOINT SP2 ;

INSERT INTO productos  (nombre, precio, descripcion, tipo_id)
VALUES 
("Producto de prueba 9", 0,"", 14 ),
("Producto de prueba 10", 0,"", 14 ),
("Producto de prueba 11", 0,"", 14),
("Producto de prueba 12", 0,"", 14 );
SAVEPOINT SP3 ;


RELEASE SAVEPOINT SP3;

-- ROLLBACK;
-- COMMIT;

SELECT * FROM productos
where nombre like "%Producto de prueba%";

/* DELETE   FROM productos
where nombre like "%Producto de prueba%"; */ 

