MariaDB [ecobike]> ALTER TABLE clientes
    -> ADD CONSTRAINT chk_estado_cliente
    -> CHECK (estado IN ('Activo', 'Inactivo', 'Suspendido', 'Moroso'));
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_estado_cliente'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> ADD CONSTRAINT chk_tipo_cobro
    -> CHECK (tipo_cobro IN ('Hora', 'D¡a'));
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_tipo_cobro'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> ADD CONSTRAINT chk_costo_base
    -> CHECK (costo_base >= 0);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_costo_base'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> ADD CONSTRAINT chk_costo_mora
    -> CHECK (costo_mora >= 0);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_costo_mora'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE estaciones
    -> ADD CONSTRAINT chk_capacidad_estacion
    -> CHECK (capacidad_maxima > 0);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_capacidad_estacion'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE bicicletas
    -> ADD CONSTRAINT chk_estado_bicicleta
    -> CHECK (estado IN ('Disponible', 'Alquilada', 'Mantenimiento', 'Inactiva'));
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_estado_bicicleta'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE bicicletas
    -> ADD CONSTRAINT chk_estacion_bicicleta
    -> CHECK (
    ->     (estado = 'Disponible' AND id_estacion_actual IS NOT NULL)
    ->     OR
    ->     (estado = 'Alquilada' AND id_estacion_actual IS NULL)
    ->     OR
    ->     estado IN ('Mantenimiento', 'Inactiva')
    -> );
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_estacion_bicicleta'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_estado_alquiler
    -> CHECK (estado_alquiler IN ('Activo', 'Finalizado', 'Vencido', 'Cancelado'));
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_estado_alquiler'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_estado_pago
    -> CHECK (estado_pago IN ('Pendiente', 'Pagado', 'Moroso'));
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_estado_pago'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_fecha_limite
    -> CHECK (fecha_hora_limite > fecha_hora_inicio);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_fecha_limite'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_costo_normal
    -> CHECK (costo_normal >= 0);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_costo_normal'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_monto_mora
    -> CHECK (monto_mora >= 0);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_monto_mora'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_monto_total
    -> CHECK (monto_total >= 0);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_monto_total'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_total_alquiler
    -> CHECK (monto_total = costo_normal + monto_mora);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_total_alquiler'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> ADD CONSTRAINT chk_tipo_mantenimiento
    -> CHECK (tipo_mantenimiento IN ('Preventivo', 'Correctivo'));
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_tipo_mantenimiento'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> ADD CONSTRAINT chk_estado_mantenimiento
    -> CHECK (estado IN ('Pendiente', 'En proceso', 'Finalizado', 'Cancelado'));
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_estado_mantenimiento'
MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> ADD CONSTRAINT chk_costo_mantenimiento
    -> CHECK (costo >= 0);
ERROR 1826 (HY000): Duplicate CHECK constraint name 'chk_costo_mantenimiento'
MariaDB [ecobike]> ALTER TABLE clientes
    -> DROP CONSTRAINT chk_estado_cliente;
Query OK, 0 rows affected (0.014 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> DROP CONSTRAINT chk_tipo_cobro;
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> DROP CONSTRAINT chk_costo_base;
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> DROP CONSTRAINT chk_costo_mora;
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE estaciones
    -> DROP CONSTRAINT chk_capacidad_estacion;
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE bicicletas
    -> DROP CONSTRAINT chk_estado_bicicleta;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE bicicletas
    -> DROP CONSTRAINT chk_estacion_bicicleta;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> DROP CONSTRAINT chk_estado_alquiler;
Query OK, 0 rows affected (0.005 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> DROP CONSTRAINT chk_estado_pago;
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> DROP CONSTRAINT chk_fecha_limite;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> DROP CONSTRAINT chk_costo_normal;
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> DROP CONSTRAINT chk_monto_mora;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> DROP CONSTRAINT chk_monto_total;
Query OK, 0 rows affected (0.008 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> DROP CONSTRAINT chk_total_alquiler;
Query OK, 0 rows affected (0.010 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> DROP CONSTRAINT chk_tipo_mantenimiento;
Query OK, 0 rows affected (0.011 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> DROP CONSTRAINT chk_estado_mantenimiento;
Query OK, 0 rows affected (0.008 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> DROP CONSTRAINT chk_costo_mantenimiento;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> ALTER TABLE clientes
    -> ADD CONSTRAINT chk_estado_cliente
    -> CHECK (estado IN ('Activo', 'Inactivo', 'Suspendido', 'Moroso'));
Query OK, 0 rows affected (0.086 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> ADD CONSTRAINT chk_tipo_cobro
    -> CHECK (tipo_cobro IN ('Hora', 'D¡a'));
Query OK, 0 rows affected (0.049 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> ADD CONSTRAINT chk_costo_base
    -> CHECK (costo_base >= 0);
Query OK, 0 rows affected (0.055 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE planes
    -> ADD CONSTRAINT chk_costo_mora
    -> CHECK (costo_mora >= 0);
Query OK, 0 rows affected (0.053 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE estaciones
    -> ADD CONSTRAINT chk_capacidad_estacion
    -> CHECK (capacidad_maxima > 0);
Query OK, 0 rows affected (0.048 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE bicicletas
    -> ADD CONSTRAINT chk_estado_bicicleta
    -> CHECK (estado IN ('Disponible', 'Alquilada', 'Mantenimiento', 'Inactiva'));
Query OK, 0 rows affected (0.047 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE bicicletas
    -> ADD CONSTRAINT chk_estacion_bicicleta
    -> CHECK (
    ->     (estado = 'Disponible' AND id_estacion_actual IS NOT NULL)
    ->     OR
    ->     (estado = 'Alquilada' AND id_estacion_actual IS NULL)
    ->     OR
    ->     estado IN ('Mantenimiento', 'Inactiva')
    -> );
Query OK, 0 rows affected (0.044 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_estado_alquiler
    -> CHECK (estado_alquiler IN ('Activo', 'Finalizado', 'Vencido', 'Cancelado'));
Query OK, 0 rows affected (0.047 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_estado_pago
    -> CHECK (estado_pago IN ('Pendiente', 'Pagado', 'Moroso'));
Query OK, 0 rows affected (0.052 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_fecha_limite
    -> CHECK (fecha_hora_limite > fecha_hora_inicio);
Query OK, 0 rows affected (0.044 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_costo_normal
    -> CHECK (costo_normal >= 0);
Query OK, 0 rows affected (0.054 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_monto_mora
    -> CHECK (monto_mora >= 0);
Query OK, 0 rows affected (0.041 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_monto_total
    -> CHECK (monto_total >= 0);
Query OK, 0 rows affected (0.038 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE alquileres
    -> ADD CONSTRAINT chk_total_alquiler
    -> CHECK (monto_total = costo_normal + monto_mora);
Query OK, 0 rows affected (0.034 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> ADD CONSTRAINT chk_tipo_mantenimiento
    -> CHECK (tipo_mantenimiento IN ('Preventivo', 'Correctivo'));
Query OK, 0 rows affected (0.041 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> ADD CONSTRAINT chk_estado_mantenimiento
    -> CHECK (estado IN ('Pendiente', 'En proceso', 'Finalizado', 'Cancelado'));
Query OK, 0 rows affected (0.038 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ecobike]> 
MariaDB [ecobike]> ALTER TABLE mantenimientos
    -> ADD CONSTRAINT chk_costo_mantenimiento
    -> CHECK (costo >= 0);
Query OK, 0 rows affected (0.033 sec)
Records: 0  Duplicates: 0  Warnings: 0

