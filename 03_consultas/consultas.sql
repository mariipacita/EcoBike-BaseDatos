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
