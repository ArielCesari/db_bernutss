
-- Creación de primera Vista:  Traemos todos los usuarios que usen GMAIL como correo electronico.

   CREATE or replace view usuarios_email AS
    (
    SELECT nombre as "Nombre de Usuario", apellido as "Apellido del usuario",  mail as "Correo electronico con dominio GMAIL"
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


 









    


