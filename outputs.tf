output "private_ip-1" {
  value = yandex_compute_instance.test[*].network_interface.0.nat_ip_address
  #value = yandex_vpc_subnet.lab-subnet[var.az[count.index % length(var.az)]].id
}


 output "nlb_ip" {
   value = flatten(yandex_lb_network_load_balancer.slurm-balancer.listener[*].external_address_spec.*.address).0
 }
 
# output "private_ssh_key" {
#   value = var.public_ssh_key_path != "" ? "" : tls_private_key.slurm-key[0].private_key_pem
#   sensitive = true
# }
