select * from biblioteca.PROFESOR;
select nom_profesor from biblioteca.PROFESOR;
select PARSENAME(replace(nom_profesor, ' ','.'),1) as nombre
	   from biblioteca.PROFESOR;
select 
  SUBSTRING(nom_profesor, 1, PATINDEX('% %',nom_profesor)) as nombre,
  SUBSTRING(nom_profesor, PATINDEX('% %',nom_profesor), LEN(nom_profesor)) as apellido
 from biblioteca.PROFESOR;

 select AVG(LEN(nom_libro)) from biblioteca.LIBRO;

select * from biblioteca.PRESTAMO_LIBRO;

update biblioteca.PRESTAMO_LIBRO set fch_prestamo = 
  DATEADD(DAY, 2, fch_prestamo)
  WHERE MONTH(fch_prestamo) = 5;








	
