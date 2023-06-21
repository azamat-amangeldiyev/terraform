resource "yandex_compute_instance" "test" {
  name        = "${var.vm_name}-vm1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"
  allow_stopping_for_update = true
  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-a.id}"
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}  

resource "yandex_compute_instance" "test-2" {
  name        = "${var.vm_name}-vm2"
  #name        = "test-2"
  platform_id = "standard-v1"
  zone        = "ru-central1-b"

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources .disk
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-b.id}"
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
} 
resource "yandex_compute_instance" "test-3" {
  name        = "${var.vm_name}-vm3"
  #name        = "test-3"
  platform_id = "standard-v1"
  zone        = "ru-central1-c"

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-c.id}"
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}   
