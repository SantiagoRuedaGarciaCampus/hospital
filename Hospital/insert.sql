use hospital;
INSERT INTO empleado VALUES(1, "Ana Garcia Lopez", 'Enfermero');
INSERT INTO empleado VALUES(2, "Javier Rodriguez Perez", 'Jefe');
INSERT INTO empleado VALUES(3, "Martha Lopez Sanchez", 'Enfermero');
INSERT INTO empleado VALUES(4, "David Fernandez Gomez", 'Jefe');
INSERT INTO empleado VALUES(5, "laura Gonzales Martinez", 'Enfermero');
INSERT INTO empleado VALUES(6, "Juan Perez Jimenez", 'Jefe');
INSERT INTO empleado VALUES(7, "Maria Sanchez Rodriguez", 'Enfermero');
INSERT INTO empleado VALUES(8, "Francisco Martinez Lopez", 'Jefe');
INSERT INTO empleado VALUES(9, "Miguel Jimenez Garcia", 'Enfermero');
INSERT INTO empleado VALUES(10, "Isabel Rameriez Fernandez", 'Jefe');

INSERT INTO empleado VALUES(11, "Alejandro Torres Martínez", 'Enfermero');
INSERT INTO empleado VALUES(12, "Carolina Vargas López", 'Jefe');
INSERT INTO empleado VALUES(13, "Ricardo Soto Ruiz", 'Enfermero');
INSERT INTO empleado VALUES(14, "David Fernandez Gomez", 'Jefe');
INSERT INTO empleado VALUES(15, "Raúl Mendoza Sánchez", 'Enfermero');
INSERT INTO empleado VALUES(16, "Andrea Guzmán Guzmán", 'Jefe');
INSERT INTO empleado VALUES(17, "Carlos Rodríguez Herrera", 'Enfermero');
INSERT INTO empleado VALUES(18, "Verónica González Ramírez", 'Jefe');
INSERT INTO empleado VALUES(19, "Javier Martínez Salgado", 'Enfermero');
INSERT INTO empleado VALUES(20, "Laura Torres Flores", 'Jefe');

INSERT INTO complejo_hospitalario VALUES(1, 'Hospital San Miguel
'), (2, 'Centro Médico Aurora
'), (3, 'Clínica Esperanza
'), (4, 'Complejo Hospitalario Alameda
'), (5, 'Centro de Salud del Valle
'),(6, 'Hospital Santa Cruz
'), (7, 'Centro Médico Renacer
'), (8, 'Clínica Los Pinos
'), (9, 'Complejo Hospitalario del Sol
'), (10, 'Centro de Salud Luna Blanca
');


INSERT INTO edificio VALUES(1,'Edificio de Consultas Sanitarias
',10), (2,'Torre de Cirugía Vanguardia
',1), (3,'Ala de Maternidad Estrella
',2), (4,'Centro de Investigación Médica Horizonte
',3), (5,'Centro de Investigación Médica Horizonte
',4), (6,'Bloque de Servicios Quirúrgicos Aurora
',4), (7,'Edificio de Rehabilitación Renacer
',6), (8,'Clínica de Salud Mental Luna Azul
',7), (9,'Torre de Radiología Lumina
',8), (10, 'Ala Pediátrica Sonrisas
',9); 

INSERT INTO piso VALUES(1, 1 , 1, '01'), (2, 3, 4, '02'), (3, 2, 3, '03'), (4, 4, 2, '04'), (5, 5, 5, '05'), (6, 6, 6, '06'), (7, 7, 7, '07'), (8, 8, 8, '08'), (9, 9, 9, '09'), (10, 10, 10, '10');

UPDATE piso
SET id_empleado = id_empleado - '10'
WHERE id = 1;


INSERT INTO especialidad VALUES(1,'Cardiología
'), (2, 'Neurología'), (3, 'Gastroenterología'), (4 ,'Oncología'), (5, 'Obstetricia y Ginecología
'), (6, 'Cirugía Ortopédica
'), (7, 'Dermatología
'), (8, 'Psiquiatría'), (9, 'Endocrinología'), (10, 'Otorrinolaringología');

INSERT INTO piso_especialidad VALUES('Principal', 1, 1), ('Secundario', 1, 2);
INSERT INTO piso_especialidad VALUES('Principal', 2, 2), ('Secundario', 2, 3);
INSERT INTO piso_especialidad VALUES('Principal', 3, 3), ('Secundario', 3, 4);
INSERT INTO piso_especialidad VALUES('Principal', 4, 4), ('Secundario', 4, 5);
INSERT INTO piso_especialidad VALUES('Principal', 5, 5), ('Secundario', 5, 6);
INSERT INTO piso_especialidad VALUES('Principal', 6, 6), ('Secundario', 6, 7);
INSERT INTO piso_especialidad VALUES('Principal', 7, 7), ('Secundario', 7, 8);
INSERT INTO piso_especialidad VALUES('Principal', 8, 8), ('Secundario', 8, 9);
INSERT INTO piso_especialidad VALUES('Principal', 9, 9), ('Secundario', 9, 10);
INSERT INTO piso_especialidad VALUES('Principal', 10, 10), ('Secundario', 10, 1);
INSERT INTO habitacion  VALUES (1, 5, 1),(2, 3, 2),(3, 7, 3),(4, 9, 4),(5, 20, 5),(6, 24, 6),(7, 12, 7),(8, 34, 8),(9, 3, 9),(10, 46, 10);









SELECT * FROM piso;

delete from empleado;1

describe especialidad;