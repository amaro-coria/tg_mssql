ALTER FUNCTION dbo.fnCalculaInfluencia(@oid_letra_1 int, @oid_letra_2 int)
RETURNS VARCHAR(15)
AS
BEGIN
	DECLARE cursorLetra1 CURSOR FOR SELECT letra from dbo.fnPalabras(@oid_letra_1)
	--
	DECLARE @palabra1 varchar(50)
	DECLARE @palabra2 varchar(50)
	DECLARE @contadorCoincidencias int
	DECLARE @influencia varchar(15)
	
	OPEN cursorLetra1
	SET @contadorCoincidencias = 0
	FETCH NEXT FROM cursorLetra1 INTO @palabra1
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE cursorLetra2 CURSOR FOR SELECT letra from dbo.fnPalabras(@oid_letra_2)
		OPEN cursorLetra2
		FETCH NEXT FROM cursorLetra2 INTO @palabra2
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @palabra1 like @palabra2
			BEGIN
				SET @contadorCoincidencias +=1
			END
			FETCH NEXT FROM cursorLetra2 INTO @palabra2
		END
		CLOSE cursorLetra2
		DEALLOCATE cursorLetra2
		FETCH NEXT FROM cursorLetra1 INTO @palabra1
	END
	CLOSE cursorLetra1
	DEALLOCATE cursorLetra1
	IF @contadorCoincidencias < 5
	BEGIN
		SET @influencia = 'BAJA'
	END
	ELSE IF @contadorCoincidencias > 5 AND @contadorCoincidencias < 15
	BEGIN
		SET @influencia = 'MEDIA'
	END
	ELSE
	BEGIN
		SET @influencia = 'ALTA'
	END
	return @influencia
END