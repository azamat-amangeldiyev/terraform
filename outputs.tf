output "private_ip-1" {
  value = yandex_compute_instance.test.network_interface.0.nat_ip_address
}

output "private_ip-2" {
  value = yandex_compute_instance.test-2.network_interface.0.nat_ip_address
}

output "private_ip-3" {
  value = yandex_compute_instance.test-3.network_interface.0.nat_ip_address
}
