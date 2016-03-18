directory '/var/www/staging_rails_app' do
  owner 'deploy_user'
  action :create
  recursive true
end

template '/etc/nginx/sites-available/default' do
  action :create
  source "default.conf.erb"
  notifies :reload, 'service[nginx]'
end
