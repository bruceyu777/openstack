module "allinone" {
  source      = "../../modules/allinone_nodes"
  providers = {
   openstack = openstack
    }
  instance_count       = 10
  start_index = 21
}

