terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.80"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0_AgAAAABhViIGAATuwQAAAADlUBbueAOaeq0CSby8ue2cyQUP5oYsZXk"
  cloud_id  = "b1g6n5hi47d45qe6etmq"
  folder_id = "b1gc2186r1ejko2jt33d"
}


provider "tls" {
  version = ">= 3.2"
}
