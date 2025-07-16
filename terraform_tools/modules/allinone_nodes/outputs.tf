output "names" {
  description = "Names of the all-in-one nodes"
  value       = [for inst in openstack_compute_instance_v2.nodes : inst.name]
}

output "ips" {
  description = "mgmt-network IPv4 addresses of the nodes"
  value       = [for inst in openstack_compute_instance_v2.nodes : inst.network[0].fixed_ip_v4]
}