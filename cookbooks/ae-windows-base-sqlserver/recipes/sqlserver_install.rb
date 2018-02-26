#
# Cookbook:: ae-windows-base-sqlserver
# Recipe:: sqlserver_install
# Author: Himmat Singh
#
# Copyright:: 2017, A+E Networks, All Rights Reserved.
# All rights reserved - Do Not Redistribute

config_prepare_file_path = "#{node['ae-windows-base-sqlserver']['sql_config_prepare_file_path']}"

windows_package 'sqlserver2014' do
  action :install
  source 'C:\\0InstallFiles\\SQL2014\\setup.exe'
  options "/q /ConfigurationFile=#{config_prepare_file_path}"
  installer_type :custom
  #not_if { ::Win32::Service.exists?("MSSQLSERVER") }
end