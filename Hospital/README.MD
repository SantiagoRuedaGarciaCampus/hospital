
#Obtener el nombre del empleado que trabaja en el piso con id 3.
```sql
SELECT e.nombre FROM empleado e 
JOIN piso p on e.id = p.id
WHERE p.id = 3;
```
#Mostrar el nombre y la especialidad de los pisos principales.
```sql
SELECT p.id, e.nombre
FROM piso p 
JOIN piso_especialidad pe on p.id = pe.id_piso
JOIN especialidad e on pe.id_especialidad = e.id
WHERE pe.estado = 'Principal';
```
#Obtener el nombre del complejo hospitalario al que pertenece el edificio con id 5.
```sql
SELECT complejo.nombre FROM complejo_hospitalario complejo
JOIN edificio ON complejo.id = edificio.id_comlplejo
WHERE edificio.id = 5;
```
#Mostrar el nombre y la cantidad de camas de las habitaciones en el piso con id 8.
```sql
SELECT h.camas
FROM habitacion h
JOIN piso p ON p.id = h.id_piso
WHERE p.id = 8;
```
#Obtener el nombre del empleado que trabaja en el edificio con id 6.
```sql
SELECT e.nombre
FROM empleado e 
JOIN piso p ON p.id_empleado = e.id
JOIN edificio ed ON p.id_edificio = ed.id 
WHERE ed.id = 6;
```
#Mostrar el nombre de las especialidades en el piso principal del edificio con id 3.
```sql
SELECT es.nombre 
FROM especialidad es 
JOIN piso_especialidad pes ON pes.id_especialidad = es.id 
JOIN piso p ON p.id = pes.id_piso
JOIN edificio ed ON ed.id = p.id_edificio
WHERE ed.id = 3 AND pes.estado = 'Principal';
```

#Obtener el nombre y el cargo de los empleados que trabajan en el edificio con id 7.
```sql
SELECT e.nombre, e.cargo
FROM empleado e 
JOIN piso p ON p.id_empleado = e.id
JOIN edificio ed ON p.id_edificio = ed.id  
WHERE ed.id = 7;
```
#Mostrar el nombre y la ubicación de los pisos con más de 15 camas.
```sql
SELECT ed.nombre, ch.nombre as ubicacion
FROM piso p 
JOIN edificio ed on p.id_edificio = ed.id 
JOIN complejo_hospitalario ch ON ch.id = ed.id_complejo
JOIN habitacion h ON p.id = h.id_piso
WHERE h.camas > 15;
```

#Obtener el nombre del complejo hospitalario que tiene el mayor número de edificios.
```sql
SELECT ch.nombre, COUNT(ed.id_complejo) AS Total
FROM complejo_hospitalario ch
JOIN edificio ed ON ch.id = ed.id_complejo
GROUP BY ch.nombre
ORDER BY Total DESC
LIMIT 1;
```
#Mostrar el nombre y la especialidad de los empleados que trabajan en el piso principal del edificio con id 1.
```sql
SELECT e.nombre, es.nombre FROM empleado e 
JOIN piso p ON p.id_empleado = e.id 
JOIN piso_especialidad pes ON p.id = pes.id_piso
JOIN especialidad es ON es.id = pes.id_especialidad
JOIN edificio ed ON p.id_edificio = ed.id
WHERE ed.id = 1;
```
#Obtener el nombre y la ubicación de los pisos donde trabaja un "Jefe".
```sql
SELECT p.id as nombre, ed.nombre as ubicacion
FROM piso p
JOIN edificio ed ON ed.id = p.id_edificio
JOIN empleado e ON e.id = p.id_empleado
WHERE e.cargo = 'Jefe';
```
#Mostrar el nombre y el cargo de los empleados que trabajan en más de un piso.
```sql
SELECT e.nombre, e.cargo
FROM empleado e 
JOIN piso p ON e.id = p.id_empleado
WHERE e.id IN(
    SELECT id_empleado as Total
    FROM piso
    GROUP BY id_empleado
    HAVING COUNT(id_empleado) >1
);
```

#Obtener el nombre y la cantidad de camas de las habitaciones en el piso principal del edificio con id 2.
    ```sql
    SELECT h.id, h.camas
    FROM habitacion h 
    JOIN piso p ON h.id_piso = p.id
    JOIN edificio ed ON p.id_edificio = ed.id
    WHERE ed.id = 2;
    ```

#Mostrar el nombre del complejo hospitalario que tiene al menos un edificio sin asignación de empleados.
    ```sql
    SELECT ch.nombre
    FROM complejo_hospitalario ch 
    JOIN  edificio ed ON ed.id_complejo = ch.id
    JOIN piso p ON ed.id = p.id_edificio
    WHERE p.id_empleado IS NULL;
    ```
/* procedimientos de almacanado */

#1. Crear un procedimiento almacenado que asigne un empleado a un piso dado su identificador.

    ```sql
    DELIMITER //
    CREATE Procedure empleado_asignar_a_piso(in idEmpleado INT, in idPiso INT)
    BEGIN
        UPDATE piso SET piso.id_empleado = idEmpleado  WHERE piso.id = idPiso;

    END //
    DELIMITER ;
    CALL empleado_asignar_a_piso(3, 10);
    ```


#2. Crear un procedimiento almacenado que asigne un empleado a un piso dado su identificador.

   ```sql
    DELIMITER //
    CREATE Procedure empleado_asignar_a_piso(in idEmpleado INT, in idPiso INT)
    BEGIN
        UPDATE piso SET piso.id_empleado = idEmpleado  WHERE piso.id = idPiso;
    END //
    DELIMITER ;
    CALL empleado_asignar_a_piso(3, 2);
   ```

#3. Crear un procedimiento almacenado que cuente el número de habitaciones en un piso específico.

   ```sql
    DELIMITER //
    CREATE PROCEDURE contar_habitacion(in idPiso int)
    BEGIN
        SELECT camas 
        into @noCamas
        FROM habitacion h 
        JOIN piso p ON h.id_piso = p.id
        WHERE p.id = idPiso;
        select @noCamas;
    END //
    DELIMITER ;
    CALL contar_habitacion(3);
   ```

#4. Crear un procedimiento almacenado que actualice la ubicación de un piso dado su identificador.

     ```sql
        DELIMITER //
        CREATE Procedure piso_ubicacion(IN pisoUbicacion CHAR(2), IN pisoId INT)
        BEGIN
            UPDATE piso SET ubicacion = pisoUbicacion WHERE id = pisoId;
        END//
        DELIMITER ; 
        SELECT * FROM piso;
        CALL piso_ubicacion('22', 4);
    ```


#5. Crear un procedimiento almacenado que elimine la asignación de un empleado de un piso dado su identificador.

```sql
    DELIMITER //
    CREATE Procedure piso_quitar_empleado(in EmpleadoId int, in PisoId int)
    BEGIN
        UPDATE piso SET id_empleado = NULL WHERE id_empleado = EmpleadoId AND id = PisoId;
    END //
    DELIMITER ;
    SELECT * FROM piso;
    CALL piso_quitar_empleado(3, 2);
```

#6. Crear un procedimiento almacenado que devuelva los empleados que tienen una especialidad específica.

     ```sql
       
     ```

#7. Crear un procedimiento almacenado que cuente el número de edificios en un complejo hospitalario específico.

    ```sql
        DELIMITER //
        CREATE Procedure contar_edificios_complejo(in ComplejoId int)
        BEGIN
            SELECT COUNT(id)
            FROM edificio 
            WHERE id_complejo = ComplejoId;
        END //
        DELIMITER ;
        CALL contar_edificios_complejo(6);
   ```   

#8. Crear un procedimiento almacenado que devuelva los pisos asignados a empleados de un cargo específico.

    ```sql
        DELIMITER //
        CREATE Procedure empleado_asignado_piso(in cargoEmpleado enum('Jefe', 'Enfermero'))
        BEGIN
            SELECT GROUP_CONCAT(p.id, ' ')
            INTO @pisos
            FROM piso p
            JOIN empleado e ON p.id_empleado = e.id
            WHERE e.cargo = cargoEmpleado;

            SELECT @pisos;
        END //
        DELIMITER ;
        CALL empleado_asignado_piso('Enfermero');
            
   ```
            
#9. Crear un procedimiento almacenado que asigne una especialidad a un piso específico.

    ```sql
    DELIMITER //
    CREATE Procedure piso_nueva_especialidad(in PisoId int, in EspecialidadId int, in tipo ENUM('Principal', 'Secundario'))
    BEGIN
        update piso_especialidad SET id_especialidad = EspecialidadId WHERE id_piso = PisoId AND estado = tipo;
    END //
    DELIMITER ;
    CALL piso_nueva_especialidad(1, 9, 'Secundario');
   ```;
   SELECT * FROM piso_especialidad;

#10. Crear un procedimiento almacenado que devuelva los empleados que no están asignados a ningún piso.

     ```sql
        DELIMITER //
        CREATE Procedure empleado_no_asignado_piso()
        BEGIN
            SELECT e.* FROM empleado e
            LEFT JOIN piso p ON e.id = p.id_empleado
            WHERE p.id_empleado IS NULL;
        END //
        DELIMITER ;
        CALL empleado_no_asignado_piso();
     ```

