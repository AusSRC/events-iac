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

# Docker
variable "ssh_key" {}
variable "docker_image" {}