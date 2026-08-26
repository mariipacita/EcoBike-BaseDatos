MariaDB [ecobike]> CREATE INDEX idx_bicicletas_estado_estacion
    -> ON bicicletas (estado, id_estacion_actual);
Query OK, 0 rows affected (0.023 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SHOW INDEX FROM bicicletas;
+------------+------------+--------------------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table      | Non_unique | Key_name                       | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+------------+------------+--------------------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| bicicletas |          0 | PRIMARY                        |            1 | id_bicicleta       | A         |          12 |     NULL | NULL   |      | BTREE      |         |               |
| bicicletas |          0 | codigo                         |            1 | codigo             | A         |          12 |     NULL | NULL   |      | BTREE      |         |               |
| bicicletas |          1 | id_estacion_actual             |            1 | id_estacion_actual | A         |          12 |     NULL | NULL   | YES  | BTREE      |         |               |
| bicicletas |          1 | idx_bicicletas_estado_estacion |            1 | estado             | A         |          12 |     NULL | NULL   |      | BTREE      |         |               |
| bicicletas |          1 | idx_bicicletas_estado_estacion |            2 | id_estacion_actual | A         |          12 |     NULL | NULL   | YES  | BTREE      |         |               |
+------------+------------+--------------------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
5 rows in set (0.001 sec)

MariaDB [ecobike]> CREATE INDEX idx_alquileres_estado_pago
    -> ON alquileres (estado_pago);
Query OK, 0 rows affected (0.018 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> SHOW INDEX FROM alquileres;
+------------+------------+----------------------------+--------------+------------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table      | Non_unique | Key_name                   | Seq_in_index | Column_name            | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+------------+------------+----------------------------+--------------+------------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| alquileres |          0 | PRIMARY                    |            1 | id_alquiler            | A         |          15 |     NULL | NULL   |      | BTREE      |         |               |
| alquileres |          1 | id_cliente                 |            1 | id_cliente             | A         |          15 |     NULL | NULL   |      | BTREE      |         |               |
| alquileres |          1 | id_bicicleta               |            1 | id_bicicleta           | A         |          15 |     NULL | NULL   |      | BTREE      |         |               |
| alquileres |          1 | id_plan                    |            1 | id_plan                | A         |           5 |     NULL | NULL   |      | BTREE      |         |               |
| alquileres |          1 | id_estacion_inicio         |            1 | id_estacion_inicio     | A         |           7 |     NULL | NULL   |      | BTREE      |         |               |
| alquileres |          1 | id_estacion_devolucion     |            1 | id_estacion_devolucion | A         |          15 |     NULL | NULL   | YES  | BTREE      |         |               |
| alquileres |          1 | idx_alquileres_estado_pago |            1 | estado_pago            | A         |           7 |     NULL | NULL   |      | BTREE      |         |               |
+------------+------------+----------------------------+--------------+------------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
7 rows in set (0.001 sec)

MariaDB [ecobike]> EXPLAIN
    -> SELECT b.codigo,
    ->        b.tipo,
    ->        e.nombre AS estacion
    -> FROM bicicletas b
    -> INNER JOIN estaciones e
    -> ON b.id_estacion_actual = e.id_estacion
    -> WHERE b.estado = 'Disponible';
+------+-------------+-------+------+---------------------------------------------------+------+---------+------+------+-------------------------------------------------+
| id   | select_type | table | type | possible_keys                                     | key  | key_len | ref  | rows | Extra                                           |
+------+-------------+-------+------+---------------------------------------------------+------+---------+------+------+-------------------------------------------------+
|    1 | SIMPLE      | e     | ALL  | PRIMARY                                           | NULL | NULL    | NULL | 3    |                                                 |
|    1 | SIMPLE      | b     | ALL  | id_estacion_actual,idx_bicicletas_estado_estacion | NULL | NULL    | NULL | 12   | Using where; Using join buffer (flat, BNL join) |
+------+-------------+-------+------+---------------------------------------------------+------+---------+------+------+-------------------------------------------------+
2 rows in set (0.003 sec)

MariaDB [ecobike]> EXPLAIN
    -> SELECT *
    -> FROM alquileres
    -> WHERE estado_pago = 'Moroso';
+------+-------------+------------+------+----------------------------+----------------------------+---------+-------+------+-----------------------+
| id   | select_type | table      | type | possible_keys              | key                        | key_len | ref   | rows | Extra                 |
+------+-------------+------------+------+----------------------------+----------------------------+---------+-------+------+-----------------------+
|    1 | SIMPLE      | alquileres | ref  | idx_alquileres_estado_pago | idx_alquileres_estado_pago | 62      | const | 2    | Using index condition |
+------+-------------+------------+------+----------------------------+----------------------------+---------+-------+------+-----------------------+
1 row in set (0.002 sec)

