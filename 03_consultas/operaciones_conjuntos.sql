MariaDB [ecobike]> SELECT codigo
    -> FROM bicicletas
    -> 
    -> UNION
    -> 
    -> SELECT codigo_bicicleta
    -> FROM inventario_fisico;
+---------+
| codigo  |
+---------+
| BICI001 |
| BICI002 |
| BICI003 |
| BICI004 |
| BICI005 |
| BICI006 |
| BICI007 |
| BICI008 |
| BICI009 |
| BICI010 |
| BICI011 |
| BICI012 |
| BICI999 |
+---------+
13 rows in set (0.001 sec)

MariaDB [ecobike]> SELECT codigo
    -> FROM bicicletas
    -> WHERE codigo IN (
    ->     SELECT codigo_bicicleta
    ->     FROM inventario_fisico
    -> );
+---------+
| codigo  |
+---------+
| BICI001 |
| BICI002 |
| BICI003 |
| BICI004 |
| BICI005 |
| BICI008 |
| BICI009 |
| BICI010 |
| BICI011 |
+---------+
9 rows in set (0.002 sec)

MariaDB [ecobike]> SELECT codigo
    -> FROM bicicletas
    -> WHERE codigo NOT IN (
    ->     SELECT codigo_bicicleta
    ->     FROM inventario_fisico
    -> );
+---------+
| codigo  |
+---------+
| BICI006 |
| BICI007 |
| BICI012 |
+---------+
3 rows in set (0.004 sec)

MariaDB [ecobike]> SELECT codigo_bicicleta
    -> FROM inventario_fisico
    -> WHERE codigo_bicicleta NOT IN (
    ->     SELECT codigo
    ->     FROM bicicletas
    -> );
+------------------+
| codigo_bicicleta |
+------------------+
| BICI999          |
+------------------+
1 row in set (0.001 sec)

MariaDB [ecobike]> notee;
