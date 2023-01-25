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

# Networking port
network_id          = "83f39431-fb67-45c6-a836-5920301128d2"
security_group_id   = "eb8137c2-964f-49a3-9943-7b965b22942f"