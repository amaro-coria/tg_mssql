


CREATE TABLE ASIGNATURA ( 
	cod_asignatura varchar(10) NOT NULL,
	nom_asignatura varchar(50)
)
;

CREATE TABLE COLEGIO ( 
	cod_colegio varchar(10) NOT NULL,
	nom_colegio varchar(50) NOT NULL
)
;

CREATE TABLE CURSO ( 
	cod_curso varchar(10) NOT NULL,
	nom_curso varchar(50) NOT NULL
)
;

CREATE TABLE EDITORIAL ( 
	cod_editorial varchar(10) NOT NULL,
	nom_editorial varchar(50) NOT NULL
)
;

CREATE TABLE LIBRO ( 
	cod_libro varchar(10) NOT NULL,
	nom_libro varchar(50) NOT NULL,
	cod_editorial varchar(10) NOT NULL,
	cod_asignatura varchar(10) NOT NULL
)
;

CREATE TABLE PRESTAMO_LIBRO ( 
	id_prestamo int identity(1,1)  NOT NULL,
	fch_prestamo date NOT NULL,
	cod_profesor varchar(10) NOT NULL,
	cod_libro varchar(10) NOT NULL
)
;

CREATE TABLE PROFESOR ( 
	cod_profesor varchar(10) NOT NULL,
	nom_profesor varchar(50) NOT NULL,
	aula varchar(20),
	cod_curso varchar(10) NOT NULL,
	cod_colegio varchar(10) NOT NULL
)
;


ALTER TABLE ASIGNATURA ADD CONSTRAINT PK_ASIGNATURA 
	PRIMARY KEY CLUSTERED (cod_asignatura)
;

ALTER TABLE COLEGIO ADD CONSTRAINT PK_COLEGIO 
	PRIMARY KEY CLUSTERED (cod_colegio)
;

ALTER TABLE CURSO ADD CONSTRAINT PK_CURSO 
	PRIMARY KEY CLUSTERED (cod_curso)
;

ALTER TABLE EDITORIAL ADD CONSTRAINT PK_EDITORIAL 
	PRIMARY KEY CLUSTERED (cod_editorial)
;

ALTER TABLE LIBRO ADD CONSTRAINT PK_LIBRO 
	PRIMARY KEY CLUSTERED (cod_libro)
;

ALTER TABLE PRESTAMO_LIBRO ADD CONSTRAINT PK_PRESTAMO_LIBRO 
	PRIMARY KEY CLUSTERED (id_prestamo)
;

ALTER TABLE PROFESOR ADD CONSTRAINT PK_PROFESOR 
	PRIMARY KEY CLUSTERED (cod_profesor)
;



ALTER TABLE LIBRO ADD CONSTRAINT FK_LIBRO_ASIGNATURA 
	FOREIGN KEY (cod_asignatura) REFERENCES ASIGNATURA (cod_asignatura)
;

ALTER TABLE LIBRO ADD CONSTRAINT FK_LIBRO_EDITORIAL 
	FOREIGN KEY (cod_editorial) REFERENCES EDITORIAL (cod_editorial)
;

ALTER TABLE PRESTAMO_LIBRO ADD CONSTRAINT FK_PRESTAMO_LIBRO_PROFESOR 
	FOREIGN KEY (cod_profesor) REFERENCES PROFESOR (cod_profesor)
;

ALTER TABLE PROFESOR ADD CONSTRAINT FK_PROFESOR_COLEGIO 
	FOREIGN KEY (cod_colegio) REFERENCES COLEGIO (cod_colegio)
;

ALTER TABLE PROFESOR ADD CONSTRAINT FK_PROFESOR_CURSO 
	FOREIGN KEY (cod_curso) REFERENCES CURSO (cod_curso)
;
