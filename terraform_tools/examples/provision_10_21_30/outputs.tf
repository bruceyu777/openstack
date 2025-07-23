# Emit a list of maps: each map associates a node name to its mgmt IP
output "nodes_info" {
  description = "List of objects mapping node names to their mgmt IPs"
  value = [
    for idx, name in module.allinone.names :
    {
      name = name,
      ip   = module.allinone.ips[idx],
    }
  ]
}