select * from dbo.ordenes;
/*
select 
	id_orden, fecha, id_cliente, 
	DAY(fecha) dia_fecha, 
	MONTH(fecha) mes_fecha, 
	YEAR(fecha) anio_fecha 
from dbo.ordenes;
*/
select * from dbo.articulos;

update dbo.articulos set precio = 50.25 where num_articulo = 3;

/*
select 
	num_articulo, nom_articulo, precio, 
	CAST(precio as int) as precio_entero,
	CAST(FLOOR(precio) as int) as precio_reducido,
	CAST(CEILING(precio) as int) as precio_elevado
from dbo.articulos;
*/
