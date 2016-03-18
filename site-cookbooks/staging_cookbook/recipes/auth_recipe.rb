include_recipe "staging_cookbook::deploy_user_recipe"

directory "/home/deploy_user/.ssh" do
  action :create
  owner "deploy_user"
  mode "0700"
end

cookbook_file "/home/deploy_user/.ssh/id_rsa" do
  action :create
  owner "deploy_user"
  mode "0600"
end

cookbook_file "/home/deploy_user/.ssh/authorized_keys" do
  action :create
  owner "deploy_user"
  mode "0600"
end
