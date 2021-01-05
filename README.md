# mysql-backup-rclone

Ok, so I just added [rclone](https://github.com/rclone/rclone) to [mysql-backup](https://github.com/databacker/mysql-backup) docker image, because I wanted to use rclone after backup and put my backups somewhere.


## How to

To use it you should create two files: .env and config-rclone/rclone.conf

In .env you should provide all these variables:
```
MYSQL_HOST=
MYSQL_PORT=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=
DB_DUMP_FREQ=
BACKUP_DIR=
RCLONE_TARGET=
```
DB_DUMP_FREQ - run every x minutes, BACKUP_DIR - dir to store backups (be careful about rights in this dir - it will be written as another user), RCLONE_TARGET - rclone path where you want to store your backups.

In config-rclone/rclone.conf you should put rclone configuration with your providers, which you want to use in RCLONE_TARGET. You could set up rclone configuration on your local PC and then just copy it, but be sure to install the same version.

For more documentation about mysql-backup variables please visit it's [readme](https://github.com/databacker/mysql-backup).


## License

According to Rclone's license I also used MIT, you're welcome.
