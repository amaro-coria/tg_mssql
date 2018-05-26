CREATE TABLE ACTOR ( 
	cod_actor varchar(10) NOT NULL,
	nom_actor varchar(50) NOT NULL,
	fch_nac_actor date
)
;

CREATE TABLE ALQUILER ( 
	cod_alquiler varchar(10) NOT NULL,
	no_membresia int NOT NULL,
	cod_casette varchar(10) NOT NULL,
	fch_alquiler date NOT NULL,
	cod_pelicula varchar(10) NOT NULL,
	fch_devolucion date NOT NULL
)
;

CREATE TABLE CASETTE ( 
	cod_casette varchar(10) NOT NULL,
	num_copias int NOT NULL,
	formato varchar(10) NOT NULL,
	val_alquiler numeric(10,2) NOT NULL
)
;

CREATE TABLE CATEGORIA ( 
	cod_categoria varchar(10) NOT NULL,
	desc_categoria varchar(50) NOT NULL
)
;

CREATE TABLE CLIENTE ( 
	cod_cliente varchar(10) NOT NULL,
	nom_cliente varchar(50) NOT NULL,
	dir_cliente varchar(50),
	tel_cliente varchar(15)
)
;

CREATE TABLE MEMBRESIA ( 
	no_membresia int identity(1,1)  NOT NULL,
	cod_cliente varchar(10) NOT NULL
)
;

CREATE TABLE PELICULA ( 
	cod_pelicula varchar(10) NOT NULL,
	titulo_pelicula varchar(50) NOT NULL,
	cod_categoria varchar(10),
	cod_actor varchar(10)
)
;


ALTER TABLE ACTOR ADD CONSTRAINT PK_ACTOR 
	PRIMARY KEY CLUSTERED (cod_actor)
;

ALTER TABLE ALQUILER ADD CONSTRAINT PK_ALQUILER 
	PRIMARY KEY CLUSTERED (cod_alquiler)
;

ALTER TABLE CASETTE ADD CONSTRAINT PK_CASETTE 
	PRIMARY KEY CLUSTERED (cod_casette)
;

ALTER TABLE CATEGORIA ADD CONSTRAINT PK_CATEGORIA 
	PRIMARY KEY CLUSTERED (cod_categoria)
;

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE 
	PRIMARY KEY CLUSTERED (cod_cliente)
;

ALTER TABLE MEMBRESIA ADD CONSTRAINT PK_MEMBRESIA 
	PRIMARY KEY CLUSTERED (no_membresia)
;

ALTER TABLE PELICULA ADD CONSTRAINT PK_PELICULA 
	PRIMARY KEY CLUSTERED (cod_pelicula)
;



ALTER TABLE ALQUILER ADD CONSTRAINT FK_ALQUILER_CASETTE 
	FOREIGN KEY (cod_casette) REFERENCES CASETTE (cod_casette)
;

ALTER TABLE ALQUILER ADD CONSTRAINT FK_ALQUILER_MEMBRESIA 
	FOREIGN KEY (no_membresia) REFERENCES MEMBRESIA (no_membresia)
;

ALTER TABLE ALQUILER ADD CONSTRAINT FK_ALQUILER_PELICULA 
	FOREIGN KEY (cod_pelicula) REFERENCES PELICULA (cod_pelicula)
;

ALTER TABLE MEMBRESIA ADD CONSTRAINT FK_MEMBRESIA_CLIENTE 
	FOREIGN KEY (cod_cliente) REFERENCES CLIENTE (cod_cliente)
;

ALTER TABLE PELICULA ADD CONSTRAINT FK_PELICULA_ACTOR 
	FOREIGN KEY (cod_actor) REFERENCES ACTOR (cod_actor)
;

ALTER TABLE PELICULA ADD CONSTRAINT FK_PELICULA_CATEGORIA 
	FOREIGN KEY (cod_categoria) REFERENCES CATEGORIA (cod_categoria)
;
