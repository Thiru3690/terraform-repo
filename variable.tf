variable "REGION" {

type = string
default = "us-east-1"
}

variable "Zone1" {
default = "us-east-1a"
}

variable "AMIS" {
default = "ami-085a17a5546829649"
}
variable "security" {
 type = list(string)
default = ["sg-03ad391fc9da0a0c9"]
}

variable "USER" {
  default = "ec2-user"
}
