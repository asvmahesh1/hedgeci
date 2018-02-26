windows_package 'Cylance' do
  source 'http://ae-infra-software.s3.amazonaws.com/Cylance/CylanceProtect_x64.msi'
  action :install
  options '/qn PIDKEY=1cxH7G2qZuYRnlM49AGl3TDN VENUEZONE="A+E AWS" /L*v C:\Cylance_Install.log'
end
