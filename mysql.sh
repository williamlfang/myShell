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
