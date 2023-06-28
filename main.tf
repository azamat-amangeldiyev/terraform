resource "yandex_vpc_network" "lab-net" {
  name = "${local.prefix}-lab-network"
}

resource "yandex_vpc_subnet" "lab-subnet" {
  for_each = toset(var.az)
  name = "test-${each.value}" 
  v4_cidr_blocks = var.cidr_blocks[index(var.az, each.value)]
  zone           = each.value
  network_id     = "${yandex_vpc_network.lab-net.id}" 
  labels = var.labels
}

