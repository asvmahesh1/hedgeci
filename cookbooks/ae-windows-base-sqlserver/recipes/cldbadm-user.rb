user 'cldbadm' do
    comment "DBA Team Cloud User"
    password '@dMc1db'
    action :create
end

group "Administrators" do
    action :modify
    members "cldbadm"
    append true
end