powershell_script 'install Nuget package provider' do
  code 'Install-PackageProvider -Name NuGet -Force'
  not_if '(Get-PackageProvider -Name Nuget -ListAvailable -ErrorAction SilentlyContinue) -ne $null'
  not_if { reboot_pending? }
end

%w{PSWindowsUpdate xNetworking xRemoteDesktopAdmin xCertificate xComputerManagement}.each do |ps_module|
  powershell_script "install #{ps_module} module" do
    code "Install-Module #{ps_module} -Force"
    not_if "(Get-Module #{ps_module} -list) -ne $null"
    not_if { reboot_pending? }
  end
end
