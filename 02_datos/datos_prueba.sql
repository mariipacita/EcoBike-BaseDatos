MariaDB [ecobike]> INSERT INTO planes
    -> (nombre_plan, tipo_cobro, costo_base, costo_mora, estado)
    -> VALUES
    -> ('Plan por Hora', 'Hora', 1000.00, 500.00, 'Activo'),
    -> ('Plan Diario', 'D¡a', 8000.00, 2000.00, 'Activo');
Query OK, 2 rows affected (0.007 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SELECT * FROM planes;
+---------+---------------+------------+------------+------------+--------+
| id_plan | nombre_plan   | tipo_cobro | costo_base | costo_mora | estado |
+---------+---------------+------------+------------+------------+--------+
|       1 | Plan por Hora | Hora       |    1000.00 |     500.00 | Activo |
|       2 | Plan Diario   | D¡a        |    8000.00 |    2000.00 | Activo |
+---------+---------------+------------+------------+------------+--------+
2 rows in set (0.001 sec)

MariaDB [ecobike]> INSERT INTO estaciones
    -> (nombre, ubicacion, capacidad_maxima, estado)
    -> VALUES
    -> ('Estacion Central', 'Centro de la ciudad', 10, 'Activa'),
    -> ('Estacion Norte', 'Zona Norte', 8, 'Activa'),
    -> ('Estacion Sur', 'Zona Sur', 8, 'Activa');
Query OK, 3 rows affected (0.006 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SELECT * FROM estaciones;
+-------------+------------------+---------------------+------------------+--------+
| id_estacion | nombre           | ubicacion           | capacidad_maxima | estado |
+-------------+------------------+---------------------+------------------+--------+
|           1 | Estacion Central | Centro de la ciudad |               10 | Activa |
|           2 | Estacion Norte   | Zona Norte          |                8 | Activa |
|           3 | Estacion Sur     | Zona Sur            |                8 | Activa |
+-------------+------------------+---------------------+------------------+--------+
3 rows in set (0.002 sec)

MariaDB [ecobike]> INSERT INTO clientes
    -> (cedula, nombre, telefono, correo, estado, id_plan, fecha_registro)
    -> VALUES
    -> ('101010101', 'Maripaz Chavarria', '8888-1001', 'maripaz@email.com', 'Activo', 1, NOW()),
    -> ('202020202', 'Abby Rodriguez', '8888-1002', 'abby@email.com', 'Activo', 2, NOW()),
    -> ('303030303', 'Jefferson Mendez', '8888-1003', 'jefferson@email.com', 'Moroso', 1, NOW()),
    -> ('404040404', 'Felix Vargas', '8888-1004', 'felix@email.com', 'Moroso', 2, NOW()),
    -> ('505050505', 'Ivannia Jimenez', '8888-1005', 'ivannia@email.com', 'Activo', 1, NOW()),
    -> ('606060606', 'Daniel Mora', '8888-1006', 'daniel@email.com', 'Activo', 2, NOW()),
    -> ('707070707', 'Sofia Castro', '8888-1007', 'sofia@email.com', 'Suspendido', 1, NOW()),
    -> ('808080808', 'Andres Ruiz', '8888-1008', 'andres@email.com', 'Inactivo', 2, NOW()),
    -> ('909090909', 'Paula Sanchez', '8888-1009', 'paula@email.com', 'Activo', 1, NOW()),
    -> ('111222333', 'Miguel Herrera', '8888-1010', 'miguel@email.com', 'Activo', 2, NOW());
Query OK, 10 rows affected (0.010 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SELECT * FROM clientes;
+------------+-----------+-------------------+-----------+---------------------+------------+---------+---------------------+
| id_cliente | cedula    | nombre            | telefono  | correo              | estado     | id_plan | fecha_registro      |
+------------+-----------+-------------------+-----------+---------------------+------------+---------+---------------------+
|          1 | 101010101 | Maripaz Chavarria | 8888-1001 | maripaz@email.com   | Activo     |       1 | 2026-08-26 03:58:04 |
|          2 | 202020202 | Abby Rodriguez    | 8888-1002 | abby@email.com      | Activo     |       2 | 2026-08-26 03:58:04 |
|          3 | 303030303 | Jefferson Mendez  | 8888-1003 | jefferson@email.com | Moroso     |       1 | 2026-08-26 03:58:04 |
|          4 | 404040404 | Felix Vargas      | 8888-1004 | felix@email.com     | Moroso     |       2 | 2026-08-26 03:58:04 |
|          5 | 505050505 | Ivannia Jimenez   | 8888-1005 | ivannia@email.com   | Activo     |       1 | 2026-08-26 03:58:04 |
|          6 | 606060606 | Daniel Mora       | 8888-1006 | daniel@email.com    | Activo     |       2 | 2026-08-26 03:58:04 |
|          7 | 707070707 | Sofia Castro      | 8888-1007 | sofia@email.com     | Suspendido |       1 | 2026-08-26 03:58:04 |
|          8 | 808080808 | Andres Ruiz       | 8888-1008 | andres@email.com    | Inactivo   |       2 | 2026-08-26 03:58:04 |
|          9 | 909090909 | Paula Sanchez     | 8888-1009 | paula@email.com     | Activo     |       1 | 2026-08-26 03:58:04 |
|         10 | 111222333 | Miguel Herrera    | 8888-1010 | miguel@email.com    | Activo     |       2 | 2026-08-26 03:58:04 |
+------------+-----------+-------------------+-----------+---------------------+------------+---------+---------------------+
10 rows in set (0.003 sec)

MariaDB [ecobike]> INSERT INTO empleados
    -> (cedula, nombre, correo, cargo, estado)
    -> VALUES
    -> ('501110111', 'Monica Rojas', 'monica@ecobike.com', 'Operacion', 'Activo'),
    -> ('502220222', 'Adriana Campos', 'adriana@ecobike.com', 'Mantenimiento', 'Activo'),
    -> ('503330333', 'Kevin Solano', 'kevin@ecobike.com', 'Mantenimiento', 'Activo'),
    -> ('504440444', 'Alfredo Brenes', 'alfredo@ecobike.com', 'Administracion', 'Activo');
Query OK, 4 rows affected (0.002 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SELECT * FROM empleados;
+-------------+-----------+----------------+---------------------+----------------+--------+
| id_empleado | cedula    | nombre         | correo              | cargo          | estado |
+-------------+-----------+----------------+---------------------+----------------+--------+
|           1 | 501110111 | Monica Rojas   | monica@ecobike.com  | Operacion      | Activo |
|           2 | 502220222 | Adriana Campos | adriana@ecobike.com | Mantenimiento  | Activo |
|           3 | 503330333 | Kevin Solano   | kevin@ecobike.com   | Mantenimiento  | Activo |
|           4 | 504440444 | Alfredo Brenes | alfredo@ecobike.com | Administracion | Activo |
+-------------+-----------+----------------+---------------------+----------------+--------+
4 rows in set (0.002 sec)

MariaDB [ecobike]> INSERT INTO bicicletas
    -> (codigo, tipo, descripcion, estado, id_estacion_actual)
    -> VALUES
    -> ('BICI001', 'Urbana', 'Bicicleta urbana color azul', 'Disponible', 1),
    -> ('BICI002', 'Urbana', 'Bicicleta urbana color negra', 'Disponible', 1),
    -> ('BICI003', 'Montana', 'Bicicleta de montana color roja', 'Disponible', 2),
    -> ('BICI004', 'Electrica', 'Bicicleta electrica color blanca', 'Disponible', 2),
    -> ('BICI005', 'Urbana', 'Bicicleta urbana color verde', 'Disponible', 3),
    -> ('BICI006', 'Montana', 'Bicicleta de montana color gris', 'Alquilada', NULL),
    -> ('BICI007', 'Electrica', 'Bicicleta electrica color azul', 'Alquilada', NULL),
    -> ('BICI008', 'Urbana', 'Bicicleta urbana en revision', 'Mantenimiento', 1),
    -> ('BICI009', 'Montana', 'Bicicleta de montana en reparacion', 'Mantenimiento', 2),
    -> ('BICI010', 'Electrica', 'Bicicleta electrica color negra', 'Disponible', 3),
    -> ('BICI011', 'Urbana', 'Bicicleta urbana color blanca', 'Disponible', 1),
    -> ('BICI012', 'Montana', 'Bicicleta de montana fuera de servicio', 'Inactiva', 3);
Query OK, 12 rows affected (0.011 sec)
Records: 12  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SELECT * FROM bicicletas;
+--------------+---------+-----------+----------------------------------------+---------------+--------------------+
| id_bicicleta | codigo  | tipo      | descripcion                            | estado        | id_estacion_actual |
+--------------+---------+-----------+----------------------------------------+---------------+--------------------+
|            1 | BICI001 | Urbana    | Bicicleta urbana color azul            | Disponible    |                  1 |
|            2 | BICI002 | Urbana    | Bicicleta urbana color negra           | Disponible    |                  1 |
|            3 | BICI003 | Montana   | Bicicleta de montana color roja        | Disponible    |                  2 |
|            4 | BICI004 | Electrica | Bicicleta electrica color blanca       | Disponible    |                  2 |
|            5 | BICI005 | Urbana    | Bicicleta urbana color verde           | Disponible    |                  3 |
|            6 | BICI006 | Montana   | Bicicleta de montana color gris        | Alquilada     |               NULL |
|            7 | BICI007 | Electrica | Bicicleta electrica color azul         | Alquilada     |               NULL |
|            8 | BICI008 | Urbana    | Bicicleta urbana en revision           | Mantenimiento |                  1 |
|            9 | BICI009 | Montana   | Bicicleta de montana en reparacion     | Mantenimiento |                  2 |
|           10 | BICI010 | Electrica | Bicicleta electrica color negra        | Disponible    |                  3 |
|           11 | BICI011 | Urbana    | Bicicleta urbana color blanca          | Disponible    |                  1 |
|           12 | BICI012 | Montana   | Bicicleta de montana fuera de servicio | Inactiva      |                  3 |
+--------------+---------+-----------+----------------------------------------+---------------+--------------------+
12 rows in set (0.002 sec)

MariaDB [ecobike]> INSERT INTO inventario_fisico
    -> (codigo_bicicleta, fecha_revision, estado_encontrado, observaciones)
    -> VALUES
    -> ('BICI001', NOW(), 'Disponible', 'Bicicleta encontrada correctamente'),
    -> ('BICI002', NOW(), 'Disponible', 'Bicicleta encontrada correctamente'),
    -> ('BICI003', NOW(), 'Disponible', 'Bicicleta encontrada correctamente'),
    -> ('BICI004', NOW(), 'Disponible', 'Bicicleta encontrada correctamente'),
    -> ('BICI005', NOW(), 'Disponible', 'Bicicleta encontrada correctamente'),
    -> ('BICI008', NOW(), 'Mantenimiento', 'Bicicleta encontrada en revision'),
    -> ('BICI009', NOW(), 'Mantenimiento', 'Bicicleta encontrada en reparacion'),
    -> ('BICI010', NOW(), 'Disponible', 'Bicicleta encontrada correctamente'),
    -> ('BICI011', NOW(), 'Disponible', 'Bicicleta encontrada correctamente'),
    -> ('BICI999', NOW(), 'No registrada', 'Bicicleta encontrada fisicamente pero no registrada');
Query OK, 10 rows affected (0.005 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SELECT * FROM inventario_fisico;
+---------------+------------------+---------------------+-------------------+-----------------------------------------------------+
| id_inventario | codigo_bicicleta | fecha_revision      | estado_encontrado | observaciones                                       |
+---------------+------------------+---------------------+-------------------+-----------------------------------------------------+
|             1 | BICI001          | 2026-08-26 04:04:09 | Disponible        | Bicicleta encontrada correctamente                  |
|             2 | BICI002          | 2026-08-26 04:04:09 | Disponible        | Bicicleta encontrada correctamente                  |
|             3 | BICI003          | 2026-08-26 04:04:09 | Disponible        | Bicicleta encontrada correctamente                  |
|             4 | BICI004          | 2026-08-26 04:04:09 | Disponible        | Bicicleta encontrada correctamente                  |
|             5 | BICI005          | 2026-08-26 04:04:09 | Disponible        | Bicicleta encontrada correctamente                  |
|             6 | BICI008          | 2026-08-26 04:04:09 | Mantenimiento     | Bicicleta encontrada en revision                    |
|             7 | BICI009          | 2026-08-26 04:04:09 | Mantenimiento     | Bicicleta encontrada en reparacion                  |
|             8 | BICI010          | 2026-08-26 04:04:09 | Disponible        | Bicicleta encontrada correctamente                  |
|             9 | BICI011          | 2026-08-26 04:04:09 | Disponible        | Bicicleta encontrada correctamente                  |
|            10 | BICI999          | 2026-08-26 04:04:09 | No registrada     | Bicicleta encontrada fisicamente pero no registrada |
+---------------+------------------+---------------------+-------------------+-----------------------------------------------------+
10 rows in set (0.001 sec)

MariaDB [ecobike]> INSERT INTO alquileres
    -> (id_cliente, id_bicicleta, id_plan, id_estacion_inicio, id_estacion_devolucion,
    ->  fecha_hora_inicio, fecha_hora_limite, fecha_hora_devolucion,
    ->  estado_alquiler, costo_normal, monto_mora, monto_total,
    ->  estado_pago, fecha_pago, observaciones)
    -> VALUES
    -> (1, 6, 1, 1, NULL,
    ->  '2026-08-26 02:00:00', '2026-08-26 06:00:00', NULL,
    ->  'Activo', 0, 0, 0,
    ->  'Pendiente', NULL, 'Alquiler activo'),
    -> 
    -> (2, 7, 2, 2, NULL,
    ->  '2026-08-23 08:00:00', '2026-08-24 08:00:00', NULL,
    ->  'Vencido', 0, 0, 0,
    ->  'Pendiente', NULL, 'Alquiler vencido'),
    -> 
    -> (1, 1, 1, 1, 2,
    ->  '2026-08-01 08:00:00', '2026-08-01 10:00:00', '2026-08-01 09:45:00',
    ->  'Finalizado', 2000, 0, 2000,
    ->  'Pagado', '2026-08-01 10:00:00', 'Devuelto a tiempo'),
    -> 
    -> (3, 2, 1, 1, 2,
    ->  '2026-08-03 09:00:00', '2026-08-03 11:00:00', '2026-08-03 12:15:00',
    ->  'Finalizado', 2000, 1000, 3000,
    ->  'Moroso', NULL, 'Pago vencido'),
    -> 
    -> (4, 3, 2, 2, 3,
    ->  '2026-08-05 08:00:00', '2026-08-06 08:00:00', '2026-08-07 10:00:00',
    ->  'Finalizado', 8000, 2000, 10000,
    ->  'Moroso', NULL, 'Pago vencido'),
    -> 
    -> (5, 4, 1, 2, 1,
    ->  '2026-08-07 13:00:00', '2026-08-07 15:00:00', '2026-08-07 14:30:00',
    ->  'Finalizado', 2000, 0, 2000,
    ->  'Pagado', '2026-08-07 15:00:00', 'Sin atraso'),
    -> 
    -> (6, 5, 2, 3, 1,
    ->  '2026-08-09 09:00:00', '2026-08-10 09:00:00', '2026-08-10 08:00:00',
    ->  'Finalizado', 8000, 0, 8000,
    ->  'Pagado', '2026-08-10 09:00:00', 'Devuelto a tiempo'),
    -> 
    -> (9, 10, 1, 3, 2,
    ->  '2026-08-11 10:00:00', '2026-08-11 13:00:00', '2026-08-11 13:30:00',
    ->  'Finalizado', 3000, 500, 3500,
    ->  'Pendiente', NULL, 'Pendiente de pago'),
    -> 
    -> (10, 11, 2, 1, 3,
    ->  '2026-08-12 07:00:00', '2026-08-13 07:00:00', '2026-08-13 06:30:00',
    ->  'Finalizado', 8000, 0, 8000,
    ->  'Pagado', '2026-08-13 07:00:00', 'Finalizado normalmente'),
    -> 
    -> (1, 3, 1, 2, NULL,
    ->  '2026-08-14 08:00:00', '2026-08-14 10:00:00', NULL,
    ->  'Cancelado', 0, 0, 0,
    ->  'Pendiente', NULL, 'Cancelado antes de iniciar'),
    -> 
    -> (2, 4, 1, 2, 1,
    ->  '2026-08-15 14:00:00', '2026-08-15 16:00:00', '2026-08-15 16:00:00',
    ->  'Finalizado', 2000, 0, 2000,
    ->  'Pagado', '2026-08-15 16:10:00', 'Pagado'),
    -> 
    -> (5, 1, 2, 1, 2,
    ->  '2026-08-17 08:00:00', '2026-08-18 08:00:00', '2026-08-18 07:00:00',
    ->  'Finalizado', 8000, 0, 8000,
    ->  'Pagado', '2026-08-18 08:00:00', 'Sin mora'),
    -> 
    -> (6, 2, 1, 1, 3,
    ->  '2026-08-19 10:00:00', '2026-08-19 12:00:00', '2026-08-19 12:45:00',
    ->  'Finalizado', 2000, 500, 2500,
    ->  'Pendiente', NULL, 'Pago pendiente'),
    -> 
    -> (9, 5, 1, 3, 2,
    ->  '2026-08-20 09:00:00', '2026-08-20 11:00:00', '2026-08-20 10:45:00',
    ->  'Finalizado', 2000, 0, 2000,
    ->  'Pagado', '2026-08-20 11:00:00', 'Pagado'),
    -> 
    -> (10, 10, 2, 3, 1,
    ->  '2026-08-21 08:00:00', '2026-08-22 08:00:00', '2026-08-22 07:30:00',
    ->  'Finalizado', 8000, 0, 8000,
    ->  'Pagado', '2026-08-22 08:00:00', 'Alquiler completado');
Query OK, 15 rows affected (0.014 sec)
Records: 15  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> INSERT INTO mantenimientos
    -> (id_bicicleta, id_empleado, tipo_mantenimiento, fecha_ingreso,
    ->  fecha_finalizacion, descripcion, estado, costo)
    -> VALUES
    -> (8, 2, 'Preventivo', '2026-08-20 08:00:00',
    ->  NULL, 'Revision general y ajuste de frenos', 'En proceso', 15000),
    -> 
    -> (9, 3, 'Correctivo', '2026-08-21 09:00:00',
    ->  NULL, 'Reparacion de sistema de cambios', 'Pendiente', 22000),
    -> 
    -> (1, 2, 'Preventivo', '2026-07-15 08:00:00',
    ->  '2026-07-15 12:00:00', 'Revision general de bicicleta', 'Finalizado', 12000),
    -> 
    -> (2, 3, 'Correctivo', '2026-07-18 09:00:00',
    ->  '2026-07-19 15:00:00', 'Cambio de frenos', 'Finalizado', 18000),
    -> 
    -> (3, 2, 'Preventivo', '2026-07-22 07:30:00',
    ->  '2026-07-22 11:00:00', 'Lubricacion y ajuste de cadena', 'Finalizado', 10000),
    -> 
    -> (4, 3, 'Correctivo', '2026-07-25 10:00:00',
    ->  '2026-07-26 14:00:00', 'Reparacion del sistema electrico', 'Finalizado', 30000);
Query OK, 6 rows affected (0.006 sec)
Records: 6  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SELECT * FROM mantenimientos;
+------------------+--------------+-------------+--------------------+---------------------+---------------------+-------------------------------------+------------+----------+
| id_mantenimiento | id_bicicleta | id_empleado | tipo_mantenimiento | fecha_ingreso       | fecha_finalizacion  | descripcion                         | estado     | costo    |
+------------------+--------------+-------------+--------------------+---------------------+---------------------+-------------------------------------+------------+----------+
|                1 |            8 |           2 | Preventivo         | 2026-08-20 08:00:00 | NULL                | Revision general y ajuste de frenos | En proceso | 15000.00 |
|                2 |            9 |           3 | Correctivo         | 2026-08-21 09:00:00 | NULL                | Reparacion de sistema de cambios    | Pendiente  | 22000.00 |
|                3 |            1 |           2 | Preventivo         | 2026-07-15 08:00:00 | 2026-07-15 12:00:00 | Revision general de bicicleta       | Finalizado | 12000.00 |
|                4 |            2 |           3 | Correctivo         | 2026-07-18 09:00:00 | 2026-07-19 15:00:00 | Cambio de frenos                    | Finalizado | 18000.00 |
|                5 |            3 |           2 | Preventivo         | 2026-07-22 07:30:00 | 2026-07-22 11:00:00 | Lubricacion y ajuste de cadena      | Finalizado | 10000.00 |
|                6 |            4 |           3 | Correctivo         | 2026-07-25 10:00:00 | 2026-07-26 14:00:00 | Reparacion del sistema electrico    | Finalizado | 30000.00 |
+------------------+--------------+-------------+--------------------+---------------------+---------------------+-------------------------------------+------------+----------+
6 rows in set (0.001 sec)

MariaDB [ecobike]> SELECT estado, COUNT(*) AS cantidad
    -> FROM mantenimientos
    -> GROUP BY estado;
+------------+----------+
| estado     | cantidad |
+------------+----------+
| En proceso |        1 |
| Finalizado |        4 |
| Pendiente  |        1 |
+------------+----------+
3 rows in set (0.004 sec)

MariaDB [ecobike]> notee;
