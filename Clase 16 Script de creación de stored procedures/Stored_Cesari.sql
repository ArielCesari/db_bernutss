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


