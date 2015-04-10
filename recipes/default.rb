#
# Cookbook Name:: consul_node
# Recipe:: default

include_recipe 'docker'

directory node[:consul_node][:consul_dir] do
  owner 'root'
  mode '0755'
  action :create
end

cookbook_file 'Dockerfile' do
  path "#{node[:consul_node][:consul_dir]}/Dockerfile"
  action :create
end

cookbook_file 'consul.json' do
  path "#{node[:consul_node][:consul_dir]}/consul.json"
  action :create
end

cookbook_file 'docker.conf' do
  path '/etc/default/docker'
  action :create
end

bash 'restart_docker' do
  code 'service docker restart'
end

bash 'build_docker_image' do
  cwd node[:consul_node][:consul_dir]
  code 'docker build -t=consul_node .'
end
