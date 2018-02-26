

powershell_script 'install Nuget package provider' do
  code <<-EOH
  takeown /f c:\\windows\\WEB\\wallpaper\\Windows\\img0.jpg
  icacls c:\\windows\\WEB\\wallpaper\\Windows\\img0.jpg /Grant 'Users:(F)'
  Remove-Item c:\\windows\\WEB\\wallpaper\\Windows\\img0.jpg
  EOH
end

remote_file 'C:\windows\web\wallpaper\windows\ae-wallpaper.jpg' do
  source 'http://ae-infra-software.s3.amazonaws.com/wallpaper/wallpaper.jpg'
end

remote_file 'C:\windows\web\wallpaper\windows\img0.jpg' do
  source 'http://ae-infra-software.s3.amazonaws.com/wallpaper/wallpaper.jpg'
end
