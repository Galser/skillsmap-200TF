variable "ami" {}
variable "subnet_id" {}
variable "instance_type" {}
variable "vpc_security_group_id" { }
variable "learntag" {}

resource "aws_key_pair" "tf200-aguselietov" {
  key_name = "aguselietov-key"
  public_key =  "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "web0" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}" 
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]
  key_name              = "${aws_key_pair.tf200-aguselietov.id}"

  connection {
    user = "ubuntu"
    type = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    host     = self.public_ip
  }

  provisioner "file" {
    source = "assets"
    destination = "/tmp/"
  }

  provisioner "remote-exec" {
    inline = [
      "sh /tmp/assets/setup-web.sh"
    ]
  }

  tags = {
    "Name"      = "web0",
    "Identity"  = "goose",
    "andriitag" = "true",
    "learntag"  = "${var.learntag}"
  }
}

output "public_ip" {
  value = "${aws_instance.web0.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web0.public_dns}"
}
