resource "yandex_vpc_network" "lab-net" {
  #name = local.prefix
  name = "${local.prefix}-lab-network"
}

resource "yandex_vpc_subnet" "lab-subnet-a" {
  v4_cidr_blocks = var.cidr_blocks[0]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.lab-net.id}" 
  labels = var.labels
}

resource "yandex_vpc_subnet" "lab-subnet-b" {
  v4_cidr_blocks = var.cidr_blocks[1]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.lab-net.id}"
  labels = var.labels
}

resource "yandex_vpc_subnet" "lab-subnet-c" {
  v4_cidr_blocks = var.cidr_blocks[2]
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.lab-net.id}"
  labels = var.labels
}
