# ----------
# 处理 MySQL 
# 
# DATE: 2018-10-08
# AUTHOR: William
# ----------

## =============================================================================
## MySQL 设置密码安全

set global validate_password_policy=0;  
set global validate_password_mixed_case_count=0;  
set global validate_password_number_count=3; 
set global validate_password_special_char_count=0; 
set global validate_password_length=3;  
## =============================================================================

## =============================================================================
## 解决 Too many connections
## Ref: https://stackoverflow.com/questions/14331032/mysql-error-1040-too-many-connection/34176072
## 这种方法只是临时改变 最大连接数, 真正重启 MySQL 后还是恢复成默认的连接数
show variables like "max_connections";
set global max_connections = 2000;

## Ref: https://www.cnblogs.com/kevingrace/p/6226324.html
## 这种方法可以永久改变最大连接数

## 1. 这是由于mariadb有默认打开文件数限制。-----------------------------------------
## 可以通过配置/usr/lib/systemd/system/mariadb.service来调大打开文件数目。
vim /usr/lib/systemd/system/mariadb.service

[Service]
## mysql
LimitNOFILE=10000
LimitNPROC=10000

##重新加载系统服务，并重启mariadb服务
systemctl --system daemon-reload 
systemctl restart mariadb.service

show variables like '%open_files_limit%';
## 2. 配置/etc/my.cnf ----------------------------------------------------------

vim /etc/my.cnf

[mysqld]
max_connections = 10000

## 重启后生效
systemctl restart mariadb.service

show variables like "max_connections";
## =============================================================================
