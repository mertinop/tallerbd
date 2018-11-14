Archivo: `pg_hba.conf`
```
host   replication   postgres   127.0.0.1/0   trust
```

Archivo: `postgresql.conf`
```
wal_level = hot_standby
archive_mode = on
archive_command = 'copy "%p" "C:\\bdbackup\\%f"'  # Windows
max_wal_senders = 3
```
### En el otro servidor:
Archivo: `postgresql.conf`
```
hot_standby = on
```