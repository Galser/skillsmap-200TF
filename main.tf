provider "aws" {
  profile = "default"
  region  = "${var.region}"
}


module "mweb" {
  source                = "./mweb"

  ami                   = var.amis[var.region]
  instance_type         = "t2.micro"
  subnet_id             = var.subnet_ids[var.region]
  vpc_security_group_id = var.vpc_security_group_ids[var.region]

  learntag = "${var.learntag}"
  
}

output "mod_web0_public_ip" {
  value = "${module.mweb.public_ip}"
}

output "mod_web0_public_dns" {
  value = "${module.mweb.public_dns}"
}
