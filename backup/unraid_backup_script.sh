#!/bin/bash

varRunTime=$(date +%Y%m%d_%H%M%S)
varRunDate=$(date +%Y%m%d)
varDayOfWeek=$(date +%u)
varWeekNr=$(date +%V)
varDaysOlder=7

echo +++++++++ $(date +%Y%m%d_%H%M%S) - paperless Backup-Script gestartet +++++++++ > /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo +++++++++ $(date +%Y%m%d_%H%M%S) - remove Backups older $varDaysOlder Days +++++++++ >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
find /mnt/user/Backup/paperless/ -type f -mtime +$varDaysOlder -print >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log 2>&1
find /mnt/user/Backup/paperless/ -maxdepth 1 -type f -mtime +$varDaysOlder -name '*.zip' -execdir rm -- '{}' \; >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log 2>&1
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo +++++++++ $(date +%Y%m%d_%H%M%S) - remove Logs older $varDaysOlder Days +++++++++ >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
find /mnt/user/Backup/paperless/logs -type f -mtime +$varDaysOlder -print >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log 2>&1
find /mnt/user/Backup/paperless/logs -type f -mtime +$varDaysOlder -name '*.log' -execdir rm -- '{}' \; >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log 2>&1
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo +++++ $(date +%Y%m%d_%H%M%S) - paperless Export gestartet >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
docker exec -t paperless-ngx document_exporter ../export --delete --compare-checksums --zip --zip-name ../backup/paperless-backup_$varRunTime >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log 2>&1
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo +++++ $(date +%Y%m%d_%H%M%S) - paperless Export beendet >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
sleep 10
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo + >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
echo +++++++++ $(date +%Y%m%d_%H%M%S) - paperless Backup-Script beendet +++++++++ >> /mnt/user/Backup/paperless/logs/paperless-backup_$varRunTime.log
