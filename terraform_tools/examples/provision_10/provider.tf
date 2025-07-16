terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.45.0"
    }
  }
}

# No hard‐coded credentials here — provider will read them from OS_* env vars:
provider "openstack" {
  insecure = true
  # You can even omit this block entirely, Terraform will auto-read
  # OS_INSECURE=1 from your env and skip SSL checks for you.
}
