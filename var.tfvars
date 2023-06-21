#vm_name = "test"
image_id = "fd8dgtuscndkp3jmdb82"
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