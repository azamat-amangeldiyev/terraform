vm_name = "slurm"
vm_count = 3
image_family = "centos-7"
labels = {
  "project" = "slurm"
  "env"  = "lab"
}
cidr_blocks = [
   ["10.2.0.0/24"],
   ["10.3.0.0/24"],
   ["10.4.0.0/24"]
]
resources = {
    "cpu" = 4
    "memory" = "8"
    "disk" = "20"
}
nlb_healthcheck = {
    "name"   = "test"
    "port"   = 80
    "path"   = "/"
}