node['powershell']['installation_reboot_mode'] = immediate_reboot


include_recipe 'powershell::powershell5' do
   notifies :request, 'reboot[windows_reboot]', :immediately
  end

