#
# Cookbook:: ae-carbonblack
# Recipe:: carbonblack
#
# Copyright:: 2017, A+E Networks, All Rights Reserved.

directory 'c:\CarbonBlackClientSetup' do
  action :create
end

windows_zipfile 'c:\CarbonBlackClientSetup' do
  source 'http://ae-infra-software.s3.amazonaws.com/CarbonBlackSetup/CarbonBlackSetup.zip'
  action :unzip
end

windows_package 'CarbonBlackClient' do
  source 'C:\CarbonBlackClientSetup\CarbonBlackClientSetup.exe'
  installer_type :nsis
  action :install
  options '/S /norestart /log C:\http://webapi.aetvn.com/Common/User/GetUserObjectAccess\CBInstall.txt'
  not_if { ::Win32::Service.exists?("CarbonBlack") }
end
