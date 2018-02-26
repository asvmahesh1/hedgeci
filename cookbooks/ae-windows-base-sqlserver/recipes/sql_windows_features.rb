#
# Cookbook:: ae-windows-base-sqlserver
# Recipe:: sql_windows_features
# Author: Himmat Singh
#
# Copyright:: 2017, A+E Networks, All Rights Reserved.
# All rights reserved - Do Not Redistribute

windows_feature ['NET-Framework-Core', 'NET-Framework-45-Core', 'NET-WCF-TCP-PortSharing45', 'RSAT-AD-PowerShell', 'RSAT-AD-PowerShell', 'RSAT-ADDS', 'RSAT-AD-AdminCenter','RSAT-ADLDS', 'RSAT-ADDS-Tools'] do
  action :install
  install_method :windows_feature_powershell
end