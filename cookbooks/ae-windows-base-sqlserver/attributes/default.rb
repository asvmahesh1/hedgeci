
# SqlServer Packer AMI attributes


default['ae-windows-base-sqlserver']['sql_config_prepare_image_url'] = "https://s3.amazonaws.com/ae-infra-software/Database/DBS/ConfigurationFile.DBS.prepare_image.ini"
default['ae-windows-base-sqlserver']['sql_config_complete_image_url'] = "https://s3.amazonaws.com/ae-infra-software/Database/DBS/ConfigurationFile.DBS.complete_image.ini"
default['ae-windows-base-sqlserver']['sql_config_prepare_file_path'] = "C:\\0DBSInstallFiles\\ConfigurationFile.DBS.prepare_image.ini"
default['ae-windows-base-sqlserver']['sql_config_complete_file_path'] = "C:\\0DBSInstallFiles\\ConfigurationFile.DBS.complete_image.ini"
default['ae-windows-base-sqlserver']['sql_server_setup_url'] = "https://s3.amazonaws.com/ae-infra-software/Database/SQL2014.zip"
default['ae-windows-base-sqlserver']['sql_install_directory'] = "C:\\0DBSInstallFiles"


#default['ae-windows-base-sqlserver']['sql_server_exe_url'] = "https://s3.amazonaws.com/ae-software-dev/Database/SQL_Server_2014_EE/SQLServer2014-KB3167392-x64.exe"
#default['ae-windows-base-sqlserver']['sql_config_iso_file_path'] = "C:\\0DBSInstallFiles\\SQL_Server_2014_EE\\SW_DVD9_SQL_Svr_Enterprise_Edtn_2014w_SP1_64Bit_English_-2_MLF_X20-28966.ISO"
# https://s3.amazonaws.com/ae-release/AIM-AdSales-In-Motion/release-2.3/0DBSInstallFiles/ConfigurationFile.DBS.prepare_image.ini
# https://s3.amazonaws.com/ae-release/AIM-AdSales-In-Motion/release-2.3/0DBSInstallFiles/ConfigurationFile.DBS.complete_image.ini
# https://s3.amazonaws.com/ae-software-dev/Database/SQL_Server_2014_EE/SW_DVD9_SQL_Svr_Enterprise_Edtn_2014w_SP1_64Bit_English_-2_MLF_X20-28966.ISO