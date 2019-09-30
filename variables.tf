variable "region" {
  default = "eu-central-1"
}

# used later to delete all those instances
variable "learntag" {
  type  = "string"
  default = "200tf"
}

