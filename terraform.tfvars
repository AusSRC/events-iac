# Compute instance
instance_name   = "terraform-test"
image           = "Pawsey - Ubuntu 22.04 - 2022-05"
flavor          = "n3.8c32r"
ssh_key_pair    = "nimbus-vm"
security_group  = "aus-src-SSH-ICMP"
network         = "aus-src-network"
instance_count  = 1
root_vol_size   = 10
image_id        = "9c37814e-1e77-4b47-a14e-4368420408de"

# Docker
ssh_key = "/Users/she393/.ssh/nimbus-vm.pem"
docker_image = "ubuntu:latest"