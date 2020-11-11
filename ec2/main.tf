variable "ami_id" {}

module "ec2sandbox" {
  source  = "app.terraform.io/hashijit/ec2sandbox/aws"
  version = "0.1.0"
  ami_id  = var.ami_id
}

output "public_dns" {
  value = module.ec2sandbox.public_dns
}
