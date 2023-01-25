# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48.0"
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

resource "openstack_networking_port_v2" "port" {
  name           = "port"
  admin_state_up = "true"

  network_id = var.network_id

  security_group_ids = [
    var.security_group_id
  ]
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

# # Docker
# provider "docker" {
#   host     = "ssh://ubuntu@remote-host:22"
#   ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
# }