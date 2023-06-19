resource "yandex_vpc_network" "lab-net" {
  #name = local.prefix
  name = "${local.prefix}-lab-network"
}

resource "yandex_vpc_subnet" "lab-subnet-a" {
  v4_cidr_blocks = ["10.2.0.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.lab-net.id}" 
  labels = {         
    "project" = "slurm"
    "env" = "lab" 
  }
}

resource "yandex_vpc_subnet" "lab-subnet-b" {
  v4_cidr_blocks = ["10.3.0.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.lab-net.id}"
  labels = {
    "project" = "slurm"
    "env" = "lab"
  } 
}

resource "yandex_vpc_subnet" "lab-subnet-c" {
  v4_cidr_blocks = ["10.4.0.0/24"]
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.lab-net.id}"
  labels = {
    "project" = "slurm"
    "env" = "lab"
  } 
}
