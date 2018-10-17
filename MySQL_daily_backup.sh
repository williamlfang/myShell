#!/bin/bash
# 把运行结果保存到
# LOG_FILE=$(date +"%Y%m%d.txt")
# # exec 2>&1 >> /home/fl/myLog/$logFile
# exec 3>&1 1>>/home/fl/myLog/${LOG_FILE} 2>&1
echo -e "\n--------------------------------------------------------------------------------"
echo -e ">> $(date +'%Y-%m-%d %H:%M:%S') << MySQL_daily_backup.sh"
echo -e  "--------------------------------------------------------------------------------"

## =============================================================================
## 188
for fund in TianMi2 TianMi3 YunYang1 YunYang2 YunYang3 YunYang3a YunYang3b DongHai1 RuiLong1
do
    mysqldump -h127.0.0.1 -P3306 -uroot -p****** $fund > /data/FromMySQL/$fund.sql 
    echo -e "\n$fund \t:==> MySQL Backup is Done."
done

for db in pretrading trading posttrading
do
    mysqldump -h127.0.0.1 -P3306 -uroot -p****** $db > /data/FromMySQL/$db.sql 
    echo -e "\n$db \t:==> MySQL Backup is Done."
done

rsync -vr -e 'sshpass -p "******" ssh' /data/FromMySQL trader@192.168.1.135:/data/From188
## =============================================================================

