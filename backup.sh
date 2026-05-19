#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/home/deploy/backups"

mkdir -p $BACKUP_DIR

tar -czf $BACKUP_DIR/app_$TIMESTAMP.tar.gz -C /var/www/mon-app .

ls -t $BACKUP_DIR/app_*.tar.gz | tail -n +6 | xargs -r rm

echo "Sauvegarde terminée: $BACKUP_DIR/app_$TIMESTAMP.tar.gz"