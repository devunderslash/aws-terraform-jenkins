
provider "aws" {
  region                  = "${var.region}"
  # shared_credentials_file = "~/.aws/credentials"
  # profile                 = "development"
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "terra-jen-key"
  public_key = tls_private_key.this.public_key_openssh
}

