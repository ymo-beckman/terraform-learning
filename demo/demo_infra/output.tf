output "consul-master-ip" {
  description = "ID of the Docker container"
  value       = module.consul_cluster.consul-master-ip
}

output "consul-agent-ip-list" {
  value = module.consul_cluster.consul-agent-ip-list
}
