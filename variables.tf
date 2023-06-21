variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}
variable "image_id" {
  type        = string
  description = "image_id for virtual machine"
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