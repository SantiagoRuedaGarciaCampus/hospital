#Se desea construir una base de datos que almacene todos los  datos de una mega-clínica de la ciudad.
#Se debe manejar los datos de habitaciones por piso, cada piso maneja varias especialidades, pero tiene una especialidad principal. 
#La estructura de la clínica maneja varios edificios en el complejo hospitalario.
#De los pisos se quiere guardar, un código de piso, nombre de la enfermera jefe a cargo, y el edificio en que está. 
#De las habitaciones se desea guardar, el código, la cantidad de camas y el Piso al que pertenece.

/* Entidades */
# habitacion
# especialidad
# edificios
# empleado
# tipo_empleado
# complejo_hospitalario
# piso
CREATE DATABASE hospital;
use hospital;
CREATE TABLE  piso (
     id  INT  NOT NULL AUTO_INCREMENT,
     id_empleado  INT,
     id_edificio  INT NOT NULL,
     ubicacion  CHAR(2) NOT NULL,
    constraint Pk_id PRIMARY KEY piso(id)
);
CREATE TABLE  empleado (
     id  INT  NOT NULL AUTO_INCREMENT,
     nombre  VARCHAR(80) NOT NULL,
     cargo  ENUM('Jefe', 'Enfermero') NOT NULL,
     constraint Pk_id PRIMARY KEY empleado(id)
);
CREATE TABLE  edificio (
     id  INT  NOT NULL AUTO_INCREMENT,
     nombre  VARCHAR(80) NOT NULL,
     id_complejo  INT NOT NULL,
     constraint Pk_id PRIMARY KEY edificio(id)
);
CREATE TABLE  especialidad (
     id  INT  NOT NULL AUTO_INCREMENT,
     nombre  VARCHAR(80) NOT NULL,
     constraint Pk_id PRIMARY KEY especialidad(id)
);
CREATE TABLE  habitacion (
     id  INT  NOT NULL AUTO_INCREMENT,
     camas  INT NOT NULL,
     id_piso  INT NOT NULL,
     constraint Pk_id PRIMARY KEY habitacion(id)
);
CREATE TABLE  complejo_hospitalario (
     id  INT  NOT NULL AUTO_INCREMENT,
     nombre  VARCHAR(255) NOT NULL,
     constraint Pk_id PRIMARY KEY complejo_hospitalario(id)
);
CREATE TABLE  piso_especialidad (
     estado  ENUM('Principal', 'Secundario') NOT NULL,
     id_piso  INT NOT NULL,
     id_especialidad  INT NOT NULL
);
ALTER TABLE piso_especialidad ADD constraint FK_piso_id FOREIGN KEY(id_piso) REFERENCES piso(id);
ALTER TABLE
    edificio ADD CONSTRAINT FK_complejo_hospitalario_id FOREIGN KEY(id_comlplejo) REFERENCES complejo_hospitalario(id);
ALTER TABLE
    piso ADD CONSTRAINT Fk_empleado_id FOREIGN KEY(id_empleado) REFERENCES empleado(id);
ALTER TABLE
     piso_especialidad  ADD CONSTRAINT  Fk_especialidad_id  FOREIGN KEY( id_especialidad ) REFERENCES  especialidad ( id );
ALTER TABLE
     piso  ADD CONSTRAINT  Fk_edificio_id  FOREIGN KEY( id_edificio ) REFERENCES  edificio ( id );
ALTER TABLE
     habitacion  ADD CONSTRAINT  Fk_piso_habitacion_id  FOREIGN KEY( id_piso ) REFERENCES  piso ( id );
ALTER TABLE
     piso_especialidad  ADD CONSTRAINT  piso  FOREIGN KEY( id_piso ) REFERENCES  piso ( id );
