MariaDB [ecobike]> SELECT b.codigo,
    ->        b.tipo,
    ->        e.nombre AS estacion
    -> FROM bicicletas b
    -> INNER JOIN estaciones e
    -> ON b.id_estacion_actual = e.id_estacion
    -> WHERE b.estado = 'Disponible';
+---------+-----------+------------------+
| codigo  | tipo      | estacion         |
+---------+-----------+------------------+
| BICI001 | Urbana    | Estacion Central |
| BICI002 | Urbana    | Estacion Central |
| BICI011 | Urbana    | Estacion Central |
| BICI003 | Montana   | Estacion Norte   |
| BICI004 | Electrica | Estacion Norte   |
| BICI005 | Urbana    | Estacion Sur     |
| BICI010 | Electrica | Estacion Sur     |
+---------+-----------+------------------+
7 rows in set (0.008 sec)

MariaDB [ecobike]> SELECT b.codigo,
    ->        b.tipo,
    ->        COUNT(a.id_alquiler) AS cantidad_alquileres
    -> FROM bicicletas b
    -> INNER JOIN alquileres a
    -> ON b.id_bicicleta = a.id_bicicleta
    -> GROUP BY b.id_bicicleta, b.codigo, b.tipo
    -> ORDER BY cantidad_alquileres DESC
    -> LIMIT 5;
+---------+-----------+---------------------+
| codigo  | tipo      | cantidad_alquileres |
+---------+-----------+---------------------+
| BICI005 | Urbana    |                   2 |
| BICI004 | Electrica |                   2 |
| BICI003 | Montana   |                   2 |
| BICI002 | Urbana    |                   2 |
| BICI010 | Electrica |                   2 |
+---------+-----------+---------------------+
5 rows in set (0.001 sec)

MariaDB [ecobike]> SELECT c.nombre,
    ->        COUNT(a.id_alquiler) AS cantidad_alquileres
    -> FROM clientes c
    -> INNER JOIN alquileres a
    -> ON c.id_cliente = a.id_cliente
    -> GROUP BY c.id_cliente, c.nombre
    -> ORDER BY cantidad_alquileres DESC;
+-------------------+---------------------+
| nombre            | cantidad_alquileres |
+-------------------+---------------------+
| Maripaz Chavarria |                   3 |
| Ivannia Jimenez   |                   2 |
| Abby Rodriguez    |                   2 |
| Miguel Herrera    |                   2 |
| Paula Sanchez     |                   2 |
| Daniel Mora       |                   2 |
| Felix Vargas      |                   1 |
| Jefferson Mendez  |                   1 |
+-------------------+---------------------+
8 rows in set (0.003 sec)

MariaDB [ecobike]> SELECT p.nombre_plan,
    ->        SUM(a.monto_total) AS ingresos_totales
    -> FROM planes p
    -> INNER JOIN alquileres a
    -> ON p.id_plan = a.id_plan
    -> WHERE a.estado_pago = 'Pagado'
    -> GROUP BY p.id_plan, p.nombre_plan;
+---------------+------------------+
| nombre_plan   | ingresos_totales |
+---------------+------------------+
| Plan por Hora |          8000.00 |
| Plan Diario   |         32000.00 |
+---------------+------------------+
2 rows in set (0.001 sec)

MariaDB [ecobike]> SELECT tipo_mantenimiento,
    ->        AVG(costo) AS promedio_costo
    -> FROM mantenimientos
    -> GROUP BY tipo_mantenimiento;
+--------------------+----------------+
| tipo_mantenimiento | promedio_costo |
+--------------------+----------------+
| Correctivo         |   23333.333333 |
| Preventivo         |   12333.333333 |
+--------------------+----------------+
2 rows in set (0.002 sec)

MariaDB [ecobike]> SELECT c.nombre,
    ->        COUNT(a.id_alquiler) AS cantidad_alquileres
    -> FROM clientes c
    -> INNER JOIN alquileres a
    -> ON c.id_cliente = a.id_cliente
    -> GROUP BY c.id_cliente, c.nombre
    -> HAVING COUNT(a.id_alquiler) > 1;
+-------------------+---------------------+
| nombre            | cantidad_alquileres |
+-------------------+---------------------+
| Maripaz Chavarria |                   3 |
| Abby Rodriguez    |                   2 |
| Ivannia Jimenez   |                   2 |
| Daniel Mora       |                   2 |
| Paula Sanchez     |                   2 |
| Miguel Herrera    |                   2 |
+-------------------+---------------------+
6 rows in set (0.004 sec)

MariaDB [ecobike]> SELECT c.nombre,
    ->        COUNT(a.id_alquiler) AS cantidad_alquileres
    -> FROM clientes c
    -> LEFT JOIN alquileres a
    -> ON c.id_cliente = a.id_cliente
    -> GROUP BY c.id_cliente, c.nombre;
+-------------------+---------------------+
| nombre            | cantidad_alquileres |
+-------------------+---------------------+
| Maripaz Chavarria |                   3 |
| Abby Rodriguez    |                   2 |
| Jefferson Mendez  |                   1 |
| Felix Vargas      |                   1 |
| Ivannia Jimenez   |                   2 |
| Daniel Mora       |                   2 |
| Sofia Castro      |                   0 |
| Andres Ruiz       |                   0 |
| Paula Sanchez     |                   2 |
| Miguel Herrera    |                   2 |
+-------------------+---------------------+
10 rows in set (0.001 sec)

MariaDB [ecobike]> SELECT b.codigo,
    ->        b.tipo,
    ->        COUNT(a.id_alquiler) AS cantidad_alquileres
    -> FROM bicicletas b
    -> INNER JOIN alquileres a
    -> ON b.id_bicicleta = a.id_bicicleta
    -> GROUP BY b.id_bicicleta, b.codigo, b.tipo
    -> HAVING COUNT(a.id_alquiler) > (
    ->     SELECT AVG(cantidad)
    ->     FROM (
    ->         SELECT COUNT(*) AS cantidad
    ->         FROM alquileres
    ->         GROUP BY id_bicicleta
    ->     ) AS promedio
    -> );
+---------+-----------+---------------------+
| codigo  | tipo      | cantidad_alquileres |
+---------+-----------+---------------------+
| BICI001 | Urbana    |                   2 |
| BICI002 | Urbana    |                   2 |
| BICI003 | Montana   |                   2 |
| BICI004 | Electrica |                   2 |
| BICI005 | Urbana    |                   2 |
| BICI010 | Electrica |                   2 |
+---------+-----------+---------------------+
6 rows in set (0.005 sec)

MariaDB [ecobike]> notee;
MariaDB [ecobike]> SELECT c.cedula,
    ->        c.nombre,
    ->        b.codigo AS bicicleta,
    ->        a.fecha_hora_inicio,
    ->        a.fecha_hora_limite
    -> FROM alquileres a
    -> INNER JOIN clientes c
    -> ON a.id_cliente = c.id_cliente
    -> INNER JOIN bicicletas b
    -> ON a.id_bicicleta = b.id_bicicleta
    -> WHERE a.estado_alquiler = 'Activo';
+-----------+-------------------+-----------+---------------------+---------------------+
| cedula    | nombre            | bicicleta | fecha_hora_inicio   | fecha_hora_limite   |
+-----------+-------------------+-----------+---------------------+---------------------+
| 101010101 | Maripaz Chavarria | BICI006   | 2026-08-26 02:00:00 | 2026-08-26 06:00:00 |
+-----------+-------------------+-----------+---------------------+---------------------+
1 row in set (0.002 sec)

MariaDB [ecobike]> 
MariaDB [ecobike]> SELECT p.nombre_plan,
    ->        p.tipo_cobro,
    ->        COUNT(a.id_alquiler) AS cantidad_alquileres,
    ->        ROUND(
    ->            AVG(
    ->                CASE
    ->                    WHEN p.tipo_cobro = 'Hora'
    ->                    THEN TIMESTAMPDIFF(MINUTE, a.fecha_hora_inicio, a.fecha_hora_devolucion) / 60.0
    ->                    WHEN p.tipo_cobro = 'D¡a'
    ->                    THEN TIMESTAMPDIFF(MINUTE, a.fecha_hora_inicio, a.fecha_hora_devolucion) / 1440.0
    ->                END
    ->            ), 2
    ->        ) AS promedio_duracion
    -> FROM planes p
    -> INNER JOIN alquileres a
    -> ON p.id_plan = a.id_plan
    -> WHERE a.fecha_hora_devolucion IS NOT NULL
    -> GROUP BY p.id_plan, p.nombre_plan, p.tipo_cobro;
+---------------+------------+---------------------+-------------------+
| nombre_plan   | tipo_cobro | cantidad_alquileres | promedio_duracion |
+---------------+------------+---------------------+-------------------+
| Plan por Hora | Hora       |                   7 |              2.36 |
| Plan Diario   | D¡a        |                   5 |              1.19 |
+---------------+------------+---------------------+-------------------+
2 rows in set (0.008 sec)

MariaDB [ecobike]> 
MariaDB [ecobike]> SELECT b.codigo,
    ->        COUNT(m.id_mantenimiento) AS cantidad_mantenimientos,
    ->        COALESCE(SUM(m.costo), 0) AS costo_total
    -> FROM bicicletas b
    -> LEFT JOIN mantenimientos m
    -> ON b.id_bicicleta = m.id_bicicleta
    -> GROUP BY b.id_bicicleta, b.codigo;
+---------+-------------------------+-------------+
| codigo  | cantidad_mantenimientos | costo_total |
+---------+-------------------------+-------------+
| BICI001 |                       1 |    12000.00 |
| BICI002 |                       1 |    18000.00 |
| BICI003 |                       1 |    10000.00 |
| BICI004 |                       1 |    30000.00 |
| BICI005 |                       0 |        0.00 |
| BICI006 |                       0 |        0.00 |
| BICI007 |                       0 |        0.00 |
| BICI008 |                       1 |    15000.00 |
| BICI009 |                       1 |    22000.00 |
| BICI010 |                       0 |        0.00 |
| BICI011 |                       0 |        0.00 |
| BICI012 |                       0 |        0.00 |
+---------+-------------------------+-------------+
12 rows in set (0.001 sec)

MariaDB [ecobike]> 
MariaDB [ecobike]> SELECT c.cedula,
    ->        c.nombre,
    ->        COUNT(a.id_alquiler) AS cantidad_alquileres_morosos
    -> FROM clientes c
    -> INNER JOIN alquileres a
    -> ON c.id_cliente = a.id_cliente
    -> WHERE a.estado_pago = 'Moroso'
    -> AND c.id_cliente IN (
    ->     SELECT id_cliente
    ->     FROM alquileres
    ->     WHERE estado_pago = 'Moroso'
    -> )
    -> GROUP BY c.id_cliente, c.cedula, c.nombre
    -> HAVING COUNT(a.id_alquiler) > 0
    -> ORDER BY cantidad_alquileres_morosos DESC;
+-----------+------------------+-----------------------------+
| cedula    | nombre           | cantidad_alquileres_morosos |
+-----------+------------------+-----------------------------+
| 303030303 | Jefferson Mendez |                           1 |
| 404040404 | Felix Vargas     |                           1 |
+-----------+------------------+-----------------------------+
2 rows in set (0.001 sec)

MariaDB [ecobike]> 
MariaDB [ecobike]> SELECT c.nombre AS cliente,
    ->        b.codigo AS bicicleta,
    ->        a.fecha_hora_inicio,
    ->        a.fecha_hora_limite,
    ->        TIMESTAMPDIFF(HOUR, a.fecha_hora_limite, NOW()) AS horas_atraso
    -> FROM alquileres a
    -> INNER JOIN clientes c
    -> ON a.id_cliente = c.id_cliente
    -> INNER JOIN bicicletas b
    -> ON a.id_bicicleta = b.id_bicicleta
    -> WHERE a.estado_alquiler = 'Vencido'
    -> AND a.fecha_hora_limite < NOW()
    -> AND a.fecha_hora_devolucion IS NULL;
+----------------+-----------+---------------------+---------------------+--------------+
| cliente        | bicicleta | fecha_hora_inicio   | fecha_hora_limite   | horas_atraso |
+----------------+-----------+---------------------+---------------------+--------------+
| Abby Rodriguez | BICI007   | 2026-08-23 08:00:00 | 2026-08-24 08:00:00 |           44 |
+----------------+-----------+---------------------+---------------------+--------------+
1 row in set (0.001 sec)

MariaDB [ecobike]> 
MariaDB [ecobike]> SELECT e.nombre AS estacion,
    ->        b.estado,
    ->        COUNT(b.id_bicicleta) AS cantidad
    -> FROM bicicletas b
    -> INNER JOIN estaciones e
    -> ON b.id_estacion_actual = e.id_estacion
    -> WHERE b.id_estacion_actual IS NOT NULL
    -> GROUP BY e.id_estacion, e.nombre, b.estado;
+------------------+---------------+----------+
| estacion         | estado        | cantidad |
+------------------+---------------+----------+
| Estacion Central | Disponible    |        3 |
| Estacion Central | Mantenimiento |        1 |
| Estacion Norte   | Disponible    |        2 |
| Estacion Norte   | Mantenimiento |        1 |
| Estacion Sur     | Disponible    |        2 |
| Estacion Sur     | Inactiva      |        1 |
+------------------+---------------+----------+
6 rows in set (0.001 sec)

MariaDB [ecobike]> notee;
