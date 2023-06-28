resource "tls_private_key" "slurm-key" {
  count       = var.public_ssh_key_path != "" ? 0 : 1
  algorithm   = "RSA"
}

#output "public_key" {
#  value = tls_private_key.slurm-key[count.index].public_key_openssh
#  sensitive = true
#}
#
#output "private_key" {
#  value = var.public_ssh_key_path != "" ? "" : tls_private_key.slurm-key[count.index].private_key_pem
#  sensitive = true
#}
