resource "yandex_lb_target_group" "slurm" {
  name      = "${local.prefix}-group"
  region_id = "ru-central1-a"
  labels = var.labels

  target {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-a.id}"
    address   = "${yandex_compute_instance.test.network_interface.0.ip_address}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-a.id}"
    address   = "${yandex_compute_instance.test-2.network_interface.0.ip_address}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-a.id}"
    address   = "${yandex_compute_instance.test-3.network_interface.0.ip_address}"
  }
}


resource "yandex_lb_network_load_balancer" "slurm-balancer" {
  name = "${local.prefix}-network-balancer"
  labels = var.labels

  listener {
    name = "${local.prefix}-listener"
    port = 8080
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.slurm.id}"

    healthcheck {
      name = "var.nlb_healthcheck.name"
      http_options {
        port = var.nlb_healthcheck.port
        path = "var.nlb_healthcheck.path"
      }
    }
  }
}