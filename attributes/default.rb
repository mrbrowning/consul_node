default[:consul_node][:consul_dir] = '/opt/consul'
default[:consul_node][:primary_ip] = '172.16.0.2'

node['network']['interfaces']['eth1']['addresses'].each do |ip, params|
  if params['family'] == 'inet'
    default[:consul_node][:advertise_ip] = ip
  end
end
