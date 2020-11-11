variable "tf_org" {}
variable "tf_workspace" {}

data "terraform_remote_state" "ami" {
  backend = "remote"

  config = {
    organization = var.tf_org
    workspaces = {
      name = var.tf_workspace
    }
  }
}

module "ec2sandbox" {
  source  = "app.terraform.io/hashijit/ec2sandbox/aws"
  version = "0.1.0"
  ami_id  = data.terraform_remote_state.ami.outputs.ami_id
}

output "public_dns" {
  value = module.ec2sandbox.public_dns
}
