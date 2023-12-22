
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
