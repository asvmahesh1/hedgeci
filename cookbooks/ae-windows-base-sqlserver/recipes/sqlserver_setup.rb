#
# Cookbook:: ae-windows-base-sqlserver
# Recipe:: sqlserver_setup
# Author: Himmat Singh
#
# Copyright:: 2017, A+E Networks, All Rights Reserved.
# All rights reserved - Do Not Redistribute


# Create Softwares insatllation directory "C:\\0DBSInstallFiles"
directory node['ae-windows-base-sqlserver']['sql_install_directory'] do
  action :create
  not_if { ::File.directory?("#{node['ae-windows-base-sqlserver']['sql_install_directory']}") }
end

directory 'C:\\0InstallFiles' do
  action :create
  not_if { ::File.directory?("C:\\0InstallFiles") }
end

# Download configuration create file 
remote_file node['ae-windows-base-sqlserver']['sql_config_complete_file_path'] do
  source node['ae-windows-base-sqlserver']['sql_config_complete_image_url']
  action :create
  not_if { ::File.directory?("#{node['ae-windows-base-sqlserver']['sql_config_complete_file_path']}") }
end

# Download configuration prepare file 
remote_file node['ae-windows-base-sqlserver']['sql_config_prepare_file_path'] do
  source node['ae-windows-base-sqlserver']['sql_config_prepare_image_url']
  action :create
  not_if { ::File.directory?("#{node['ae-windows-base-sqlserver']['sql_config_prepare_file_path']}") }
end


## Download SqlServer Setup files
windows_zipfile 'C:\\0InstallFiles' do
  source node['ae-windows-base-sqlserver']['sql_server_setup_url']
  action :unzip
end

#Other way to do 
#remote_file 'C:\\0InstallFiles\\SQL2014.zip' do
#  source 'https://s3.amazonaws.com/ae-infra-software/Database/SQL2014.zip'
#  action :create
#  not_if { ::File.exist?('C:\\0InstallFiles\\SQL2014.zip') }
#end
#
# #Download SqlServer Setup files
#windows_zipfile 'C:\\0InstallFiles' do
#  source 'C:\\0InstallFiles\\SQL2014.zip'
#  action :unzip
#end