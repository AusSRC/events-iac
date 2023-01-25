# Compute instance
variable "instance_name" {}
variable "image" {}
variable "flavor" {}
variable "ssh_key_pair" {}
variable "security_group" {}
variable "network" {}
variable "instance_count" {}
variable "root_vol_size" {}
variable "image_id" {}

# Networking Port
variable "network_id" {}
variable "security_group_id" {}