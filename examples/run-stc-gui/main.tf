provider "aws" {
  region = "us-east-1"
}


data "aws_vpc" "default" {
  default = true
}

module "stc_gui" {
  source = "../.."

  vpc_id         = data.aws_vpc.default.id
  instance_count = 1

  subnet_id           = "subnet-ffe75cb2"
  ingress_cidr_blocks = ["0.0.0.0/0"]

  key_name         = "stcv_dev_key"
  private_key_file = "~/.ssh/stcv_dev_key.pem"
  src_dir          = "../../install-files"
}