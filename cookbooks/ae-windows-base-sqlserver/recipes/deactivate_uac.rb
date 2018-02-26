#
# Cookbook:: ae-windows-base-sqlserver
# Recipe:: deactivate_uac
# Author: Himmat Singh
# Copyright:: 2017, A+E Networks, All Rights Reserved.

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system' do
  values [{
    :name => 'EnableLUA',
    :type => :dword,
    :data => 0
  }]
end