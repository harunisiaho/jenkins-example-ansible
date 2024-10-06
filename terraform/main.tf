terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "5.65.0"
        }
    }
}

provider "aws" {
    region = "eu-west-1"  
}

resource "aws_instance" "test-terraform-node" {
  count = 1
  ami           = "ami-0a422d70f727fe93e"
  instance_type = "t3.medium"
  subnet_id     = "subnet-0184a80b02fa91c26"
  key_name = "isiaho_aws.pub"
  iam_instance_profile = "AmazonSSMRoleForInstancesQuickSetup"
  vpc_security_group_ids = ["sg-06f32a670b31a255b"]
  tags = {
    Name = "Jenkins-Controller-01"
    auto-delete = "no"
    "awssupport:patchwork" = "patch"
  }
}