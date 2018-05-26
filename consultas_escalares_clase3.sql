
 select * from dbo.clientes where nom_cliente like '%A%';

 select * from dbo.clientes where LEN(estado) > 5;

  --select SUM(precio) from dbo.articulos;

 select SUM(DISTINCT precio) from dbo.articulos;

 select AVG(precio) from dbo.articulos;

 select * from dbo.ordenes;
 select fecha from dbo.ordenes;
 select cast(fecha as int) from dbo.ordenes;
 select AVG(cast(fecha as int)) from dbo.ordenes;
 select AVG(cast(fecha as int)) as numerico,
    CAST(AVG(cast(fecha as int)) as datetime )
	from dbo.ordenes;
