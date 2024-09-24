locals {
  network_interface = google_compute_instance.graphdb.network_interface[0]
  instance_nat_ip   = length(local.network_interface.access_config) > 0 ? local.network_interface.access_config[0].nat_ip : null
}

output "instance_ip" {
  description = "External IP address for the GraphDB VM instance"
  value       =  local.instance_nat_ip
}

output "graphdb_address" {
  description = "External URL address for accessing GraphDB"
  value       = "http://${local.instance_nat_ip}:7200"
}
