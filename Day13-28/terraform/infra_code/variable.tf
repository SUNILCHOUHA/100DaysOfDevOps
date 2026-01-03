variable "env" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "sub_cidr" {
  type = string
}

variable "sg_cidr" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}
