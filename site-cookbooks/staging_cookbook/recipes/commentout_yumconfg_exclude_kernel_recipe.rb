file '/etc/yum.conf' do
  _file = Chef::Util::FileEdit.new(path)
  _file.search_file_replace_line('exclude=kernel', "#exclude=kernel\n")
  #content _file.send(:contents).join
  content _file.send(:editor).lines.join
  _file.write_file
  action :create
end.run_action(:create)
#end
