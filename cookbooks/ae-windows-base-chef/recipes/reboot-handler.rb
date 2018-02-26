

reboot 'windows_reboot' do
  action :nothing
  reason 'Chef requires a reboot to sucessfully run.'
  delay_mins 1
end

