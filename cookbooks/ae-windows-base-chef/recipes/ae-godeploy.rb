
windows_package 'go-deploy' do
  source 'https://s3.amazonaws.com/ae-infra-software/GoDeploy/go-agent-15.2.0-2248.exe'
  action :install
  options '/qn /norestart /SERVERIP=10.50.0.199 /D=c:\GO\GoAgent /log c:\go-agent.txt"'
end
