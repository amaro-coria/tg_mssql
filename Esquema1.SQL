CREATE TABLE articulos ( 
	num_articulo int identity(1,1)  NOT NULL,
	nom_articulo varchar(30) NOT NULL,
	precio decimal(10,2) NOT NULL
)
;

CREATE TABLE articulos_ordenes ( 
	id_orden int NOT NULL,
	num_art int NOT NULL,
	cant int NOT NULL
)
;

CREATE TABLE clientes ( 
	id_cliente int identity(1,1)  NOT NULL,
	nom_cliente varchar(50) NOT NULL,
	estado varchar(20) NOT NULL
)
;

CREATE TABLE ordenes ( 
	id_orden int identity(1,1)  NOT NULL,
	fecha datetime NOT NULL,
	id_cliente int NOT NULL
)
;


ALTER TABLE articulos ADD CONSTRAINT PK_articulos 
	PRIMARY KEY CLUSTERED (num_articulo)
;

ALTER TABLE articulos_ordenes ADD CONSTRAINT PK_articulos_ordenes 
	PRIMARY KEY CLUSTERED (id_orden, num_art)
;

ALTER TABLE clientes ADD CONSTRAINT PK_clientes 
	PRIMARY KEY CLUSTERED (id_cliente)
;

ALTER TABLE ordenes ADD CONSTRAINT PK_ordenes 
	PRIMARY KEY CLUSTERED (id_orden)
;



ALTER TABLE articulos_ordenes ADD CONSTRAINT FK_articulos_ordenes_articulos 
	FOREIGN KEY (num_art) REFERENCES articulos (num_articulo)
;

ALTER TABLE articulos_ordenes ADD CONSTRAINT FK_articulos_ordenes_ordenes 
	FOREIGN KEY (id_orden) REFERENCES ordenes (id_orden)
;

ALTER TABLE ordenes ADD CONSTRAINT FK_ordenes_clientes 
	FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
;
