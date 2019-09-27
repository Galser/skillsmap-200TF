provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "web0" {
  ami           = "ami-08a162fe1419adb2a" # official Ubunt 18.04 LTS 
  instance_type = "t2.micro"

  subnet_id              = "subnet-7282ce1a"
  vpc_security_group_ids = ["sg-04c059aea335d8f69"]

  tags = {
    "Name" = "web0",
    "Identity"  = "goose",
    "andriitag" = "true",
    "learntag"  = "200tf"
  }
}