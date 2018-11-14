# Taller 10
- Crear directorio `C:\bdbackup\`
- `C:\Program Files\PostgreSQL\9.5\data\postgresql.conf`:
```
archive_mode = on		# enables archiving; off, on, or always
archive_command = 'copy "%p" "C:\\bdbackup\\%f"'  # Windows
```
- Primer respaldo: `(psql)`
```
SELECT pg_start_backup('uno');
SELECT pg_stop_backup();
```
- Transacciones:
``` 
taller=# DROP TABLE actividad;
DROP TABLE
taller=# DROP TABLE compra;
DROP TABLE
```
- Respalddos 2 y 3:
```
taller=# SELECT pg_start_backup('dos');
 pg_start_backup
-----------------
 0/13000028
(1 fila)
taller=# SELECT pg_stop_backup();
NOTICE:  pg_stop_backup completado, todos los segmentos de WAL requeridos han sido archivados
 pg_stop_backup
----------------
 0/130000C0
(1 fila)
taller=# SELECT pg_start_backup('tres');
 pg_start_backup
-----------------
 0/14000028
(1 fila)
taller=# SELECT pg_stop_backup();
NOTICE:  pg_stop_backup completado, todos los segmentos de WAL requeridos han sido archivados
 pg_stop_backup
----------------
 0/140000C0
(1 fila)
```
- No pude restaurar :(