# ----------
# 增加新用户，
# 增加用户配置
# 
# DATE: 2018-10-08
# AUTHOR: William
# ----------

## =============================================================================
# add users and self-group
users=pc
for i in "${users[@]}"
do
    useradd -g $i
    echo abc@123 | passwd --stdin $i
    mkdir /home/$i
    rsync -r -l /etc/skel/ /home/$i
    chown -R $i:$i /home/$i
done
## =============================================================================


## =============================================================================
## 增加一个用后，使用 append 的选项
smbpasswd -a user1

## 修改拥护密码
## 输入两次新密码即可
smbpasswd fl

New SMB password:
Retype new SMB password:

## 用户连接服务器主机
## \\192.168.1.166\fl
## =============================================================================
