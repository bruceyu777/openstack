terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.45.0"
    }
  }
}

# Data lookups
data "openstack_images_image_v2"    "img"  {
  name = "all-in-one-node-v4"
}
data "openstack_compute_flavor_v2"  "flav" {
  name = "p8m32.m2"
}
data "openstack_networking_network_v2" "net" {
  name = "mgmt"
}

# Create N instances
resource "openstack_compute_instance_v2" "nodes" {
  count       = var.instance_count
  flavor_name = data.openstack_compute_flavor_v2.flav.name

  name = format(
    "all-in-one-node%02d",
    var.start_index + count.index
  )

  block_device {
    uuid                  = data.openstack_images_image_v2.img.id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
    volume_size           = 200
  }

  network {
    uuid = data.openstack_networking_network_v2.net.id
  }

  security_groups = ["default"]
}
