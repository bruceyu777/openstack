# FortiOS Release Automation (Terraform)

Provision ten `all-in-one-node21…30` instances on FortiStack/OpenStack.

## Quickstart

```bash
cd ~/openstack/terraform_tools
source openrc.sh

cd examples/provision_10
terraform init
terraform plan
terraform apply   # type “yes”

# When done:
terraform destroy
