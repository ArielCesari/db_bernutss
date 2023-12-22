/*-------------------- CREACIÓN DE USUARIOS Y PERMISOS: IMPLEMENTACIÓN DE SENTENCIAS  --------------------  */

-- Creación del primer usuario:
CREATE USER IF NOT EXISTS  'usuario_lectura'@'localhost' IDENTIFIED BY '123456';

-- Brindo permisos de solo lectura 
GRANT SELECT ON bernutss_db.* TO 'usuario_lectura'@'localhost';

-- Creación del segundo usuario 
CREATE USER IF NOT EXISTS  'usuario_modificacion'@'localhost' IDENTIFIED BY '10111213';

-- Brindo permisos de lectura, inserción y modificación de datos.
GRANT SELECT, INSERT, UPDATE ON bernutss_db.* TO 'usuario_modificacion'@'localhost';

-- Establezco que los usuarios creados no podrán eliminar registros de ninguna tabla.
REVOKE DELETE ON bernutss_db.* FROM 'usuario_lectura'@'localhost';
REVOKE DELETE ON bernutss_db.* FROM 'usuario_modificacion'@'localhost';







