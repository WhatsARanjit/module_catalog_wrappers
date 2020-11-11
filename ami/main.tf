module "ami" {
  source  = "app.terraform.io/hashijit/ami/aws"
  version = "0.1.0"
}

output "ami_id" {
  value = module.ami.ami_id
}
