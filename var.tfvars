vm_name = "slurm"
image_id = "fd82tb3u07rkdkfte3dn"
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