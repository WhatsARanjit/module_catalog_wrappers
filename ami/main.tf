# Random number generator
# Demo purposes - cause TF to run every time
resource "random_id" "random" {
  keepers = {
    uuid = "${uuid()}"
  }
  byte_length = 8
}

module "ami" {
  source  = "app.terraform.io/hashijit/ami/aws"
  version = "0.1.0"
}

output "ami_id" {
  value = module.ami.ami_id
}
