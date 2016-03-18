user 'deploy_user' do
  action :create
  supports :manage_home => true
  home "/home/deploy_user"
  shell "/bin/bash"
end
