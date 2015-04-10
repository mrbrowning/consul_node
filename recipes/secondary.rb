#
# Cookbook Name:: consul_node
# Recipe:: secondary

include_recipe 'consul_node::default'

bash 'run_primary_image' do
  user 'root'
  cwd node[:consul_node][:consul_dir]
  code <<-EOF
    docker run -d -h $HOSTNAME \
    -p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp \
    -p 8400:8400 -p 8500:8500 -p 53:53/udp --name $HOSTNAME consul_node \
    -server -advertise #{node[:consul_node][:advertise_ip]} \
    -join #{node[:consul_node][:primary_ip]}
  EOF
end
