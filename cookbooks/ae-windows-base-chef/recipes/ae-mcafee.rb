#
# Cookbook:: ae-mcafee
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


directory 'c:\McAfeeClientSetup' do
  action :create
end
windows_zipfile 'C:\McAfeeClientSetup' do
  source 'http://ae-infra-software.s3.amazonaws.com/Mcafee/mcafee.zip'
  action :unzip
end

windows_package 'MCAfeeClientSetupAgent' do
  source 'C:\\MCAfeeClientSetup\\0409\\FramePkg.exe'
  installer_type :custom
  action :install
  options '/install=agent /forceinstall /silent'
  not_if { ::Win32::Service.exists?("McAfeeFramework") }
end

windows_package 'MCAfeeClientSetupVSE' do
  source 'C:\\MCAfeeClientSetup\\0000\\setupvse.exe'
  installer_type :custom
  action :install
  options '/q'
  not_if { ::Win32::Service.exists?("McShield") }
  notifies :reboot_now, 'reboot[windows_reboot]', :immediately
end