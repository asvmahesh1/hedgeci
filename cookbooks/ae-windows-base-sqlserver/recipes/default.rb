#
# Cookbook:: ae-windows-base-sqlserver
# Recipe:: default
#
# Copyright:: 2017, A+E Networks, All Rights Reserved.

include_recipe 'ae-windows-base-sqlserver::cldbadm-user'
include_recipe 'ae-windows-base-sqlserver::deactivate_uac'
include_recipe 'ae-windows-base-sqlserver::sqlserver_setup'
include_recipe 'ae-windows-base-sqlserver::sqlserver_install'
