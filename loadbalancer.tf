resource "yandex_lb_target_group" "slurm" {
  name      = "${local.prefix}-group"
  region_id = "ru-central1"
  labels = var.labels

  dynamic "target" {
    for_each = yandex_compute_instance.test
    content {
      subnet_id = target.value.network_interface.0.subnet_id
      address   = target.value.network_interface.0.ip_address
  }
}
}


resource "yandex_lb_network_load_balancer" "slurm-balancer" {
  name = "${local.prefix}-network-balancer"
  labels = var.labels

  listener {
    name = "${local.prefix}-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.slurm.id}"

    healthcheck {
      name = var.nlb_healthcheck.name
      http_options {
        port = var.nlb_healthcheck.port
        path = "/"
      }
    }
  }
}
