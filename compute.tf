data "yandex_compute_image" "this" {
  family = var.image_family
}

resource "yandex_compute_instance" "test" {
  count = var.vm_count
  name        = "${var.vm_name}-${count.index}"
  platform_id = "standard-v1"
  zone        = var.az[count.index % length(var.az)]
  allow_stopping_for_update = true
  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.this.id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.lab-subnet[var.az[count.index % length(var.az)]].id
    nat = true
  }
  metadata = {
    #ssh-keys = var.public_ssh_key_path != "" ? file(var.public_ssh_key_path) : tls_private_key.slurm-key[0].public_key_openssh
    ssh-keys = "yc-user:${file("~/.ssh/id_ed25519.pub")}"
     #user-data = "${file("cloud-init.yaml")}"
  }

  provisioner "remote-exec" {
      inline = ["echo It is alive!"]

      connection {
        host        = self.network_interface.0.nat_ip_address
        type        = "ssh"
        user        = "centos"
        # private_key = file("~/.ssh/id_rsa")
        agent       = true
      }
  }
}  