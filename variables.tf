variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}
variable "labels" {
  type        = map(string)
  description = "Labels to add to resources"
}
variable "resources" {
  type        = object ({
    disk = number
    cpu = number
    memory = number
  } )
  description = "variable to resources"
}

variable "cidr_blocks" {
  type        = list(list(string))
  description = "List of IPv4 cidr blocks for subnet"
}

variable "nlb_healthcheck" {
  type        = object ({
    name = string
    port = number
    path = string
  } )
  description = "variable to healthcheck"
}

 variable "public_ssh_key_path" {
   type = string
   description = "Path to the public SSH key"
 }

variable "az" {
  type = list(string)
  default = [
    "ru-central1-a",
    "ru-central1-b",
    "ru-central1-c"
  ]
}

variable "vm_count" {
  type = number
  description = "number of VM to create"
}

variable "image_family" {
  type = string
  description = "Image to create vm from"
}