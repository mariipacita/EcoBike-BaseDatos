MariaDB [ecobike]> CREATE VIEW vista_bicicletas_disponibles AS
    -> SELECT b.codigo,
    ->        b.tipo,
    ->        e.nombre AS estacion
    -> FROM bicicletas b
    -> INNER JOIN estaciones e
    -> ON b.id_estacion_actual = e.id_estacion
    -> WHERE b.estado = 'Disponible';
Query OK, 0 rows affected (0.013 sec)

MariaDB [ecobike]> SELECT * FROM vista_bicicletas_disponibles;
+---------+-----------+------------------+
| codigo  | tipo      | estacion         |
+---------+-----------+------------------+
| BICI001 | Urbana    | Estacion Central |
| BICI002 | Urbana    | Estacion Central |
| BICI003 | Montana   | Estacion Norte   |
| BICI004 | Electrica | Estacion Norte   |
| BICI005 | Urbana    | Estacion Sur     |
| BICI010 | Electrica | Estacion Sur     |
| BICI011 | Urbana    | Estacion Central |
+---------+-----------+------------------+
7 rows in set (0.002 sec)

MariaDB [ecobike]> CREATE VIEW vista_alquileres_activos AS
    -> SELECT c.nombre AS cliente,
    ->        b.codigo AS bicicleta,
    ->        a.fecha_hora_inicio,
    ->        a.fecha_hora_limite,
    ->        a.estado_alquiler AS estado
    -> FROM alquileres a
    -> INNER JOIN clientes c
    -> ON a.id_cliente = c.id_cliente
    -> INNER JOIN bicicletas b
    -> ON a.id_bicicleta = b.id_bicicleta
    -> WHERE a.estado_alquiler = 'Activo';
Query OK, 0 rows affected (0.009 sec)

MariaDB [ecobike]> SELECT * FROM vista_alquileres_activos;
+-------------------+-----------+---------------------+---------------------+--------+
| cliente           | bicicleta | fecha_hora_inicio   | fecha_hora_limite   | estado |
+-------------------+-----------+---------------------+---------------------+--------+
| Maripaz Chavarria | BICI006   | 2026-08-26 02:00:00 | 2026-08-26 06:00:00 | Activo |
+-------------------+-----------+---------------------+---------------------+--------+
1 row in set (0.002 sec)

