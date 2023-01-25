# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48.0"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_domain_name    = "pawsey"
  project_domain_name = "aus-src"
  project_domain_id   = "5f2963bd4adf46b18f7d4301dbe44ad8"
  auth_url            = "https://nimbus.pawsey.org.au:5000"
  region              = "RegionOne"
}

# Create a web server
resource "openstack_compute_instance_v2" "nimbus_instance" {
  name              = var.instance_name
  image_name        = var.image
  flavor_name       = var.flavor
  key_pair          = var.ssh_key_pair
  security_groups   = ["default", var.security_group]
  network {
    name = var.network
  }
}

output "docker_host" {
  value = "ssh://ubuntu@${openstack_compute_instance_v2.nimbus_instance.access_ip_v4}:22"
  depends_on = [
    openstack_compute_instance_v2.nimbus_instance,
  ]
}

# Docker
provider "docker" {
  host     = "ssh://ubuntu@${openstack_compute_instance_v2.nimbus_instance.access_ip_v4}:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

# Pulls the image
resource "docker_image" "hello_world" {
  name = "hello-world:latest"
}

# Create a container
resource "docker_container" "hello_world" {
  image = docker_image.hello_world.image_id
  name  = "hello_world"
}