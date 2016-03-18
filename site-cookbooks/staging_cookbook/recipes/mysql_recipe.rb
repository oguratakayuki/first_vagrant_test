%w(mysql-client mysql-server).each do |pkg|
  package pkg do
    action :install
  end
end

template "create database sql" do
  path "/home/#{node['mysql']['user']}/create_databases.sql"
  source "create_databases.sql.erb"
  owner node['mysql']['user']
  group node['mysql']['group']
  mode "0644"
end

template "create users sql" do
  path "/home/#{node['mysql']['user']}/create_users.sql"
  source "create_users.sql.erb"
  owner node['mysql']['user']
  group node['mysql']['group']
  mode "0644"
end

execute "exec create databases sql" do
  command "mysql -u root --password='#{node['mysql']['server_root_password']}' < /home/#{node['mysql']['user']}/create_databases.sql"
  not_if "mysql -u root -p#{node['mysql']['server_root_password']} -D #{node['mysql']['staging_db_name']}"
  user node['mysql']['user']
  group node['mysql']['group']
  environment 'HOME' => "/home/#{node['mysql']['user']}"
end

execute "exec create users sql" do
  command "mysql -u root --password='#{node['mysql']['server_root_password']}' < /home/#{node['mysql']['user']}/create_users.sql"
  not_if "mysql -u #{node['mysql']['staging_user_name']} -p#{node['mysql']['staging_password']}"
  user node['mysql']['user']
  group node['mysql']['group']
  environment 'HOME' => "/home/#{node['mysql']['user']}"
end
