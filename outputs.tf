output "private_ip-1" {
  value = yandex_compute_instance.test.network_interface.0.nat_ip_address
}

output "private_ip-2" {
  value = yandex_compute_instance.test-2.network_interface.0.nat_ip_address
}

output "private_ip-3" {
  value = yandex_compute_instance.test-3.network_interface.0.nat_ip_address
}

output "nlb_ip" {
  value = yandex_lb_network_load_balancer.slurm-balancer.listener[*].external_address_spec.*.address
}

output "private_ssh_key" {
  value = var.public_ssh_key_path != "" ? "" : tls_private_key.slurm-key.private_key_pem
  sensitive = true
}
