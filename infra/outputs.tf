output "vm_ip" {
    description = "IP publica"
    value = google_compute_instance.caeli-engine.network_interface[0].access_config[0].nat_ip
}

output "lb_public_ip" {
    value = google_compute_global_forwarding_rule.caeli-engine-forwarding-rule.ip_address
    description = "IP publica"
}

output "ig_link" {
  value = google_compute_instance_group_manager.caeli-engine-ig.instance_group
  description = "Enlace al Instance Group"
}