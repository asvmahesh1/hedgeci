dsc_resource 'NewNameAndWorkgroup' do
  resource :xComputer
  property :name, node['ae-windows-base-chef']['machine_name']
  property :WorkGroupName, node['ae-windows-base-chef']['workgroup']
  notifies :reboot_now, 'reboot[windows_reboot]', :immediately
end
