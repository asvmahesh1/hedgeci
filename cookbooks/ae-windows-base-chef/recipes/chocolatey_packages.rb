include_recipe 'chocolatey'

chocolatey_package 'notepadplusplus' do
    action :install
end
#chocolatey_package 'powershell' do
#  action :install
#  returns [0, 3010]
# notifies :reboot_now, 'reboot[windows_reboot]', :immediately if node['ae-windows-base-chef']['reboot_mode'] != 'no_reboot'
#end
