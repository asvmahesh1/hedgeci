user 'cldbadm' do
    comment "DBA Team Cloud User"
    password '$1$lon5pfgX$d.5DTF6BcnfNQSq28g12y.'
    action :create
end

group "Administrators" do
    action :modify
    members "cldbadm"
    append true
end