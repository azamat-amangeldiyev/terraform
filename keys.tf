resource "tls_private_key" "slurm-key" {
  algorithm   = "RSA"
}

output "public_key" {
  value = tls_private_key.slurm-key.public_key_openssh
  sensitive = true
}

output "private_key" {
  value = var.public_ssh_key_path != "" ? "" : tls_private_key.slurm-key.private_key_pem
  sensitive = true
}
