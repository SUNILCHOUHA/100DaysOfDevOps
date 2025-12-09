variable "ami" {
    default = "ami-0ecb62995f68bb549"
    type = string
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "root_block_device" {
    default = 15
    type = number
}

variable "allocated_storage" {
    default = 10
    type = number
}

variable "max_allocated_storage" {
    default = 20
    type = number
}

variable "password" {
    default = "admin1234"
    type = string
}

variable "username" {
    default = "admin"
    type = string
}

variable "instance_class" {
    default = "db.t3.micro"
    type = string
}

variable "engine" {
  default = "mysql"
  type = string
}

variable "engine_version" {
  default = "8.0"
  type = string
}

variable "port" {
  default = 3306
  type = number
}


variable "pgn" {
  default = "default.mysql8.0"
  type = string
}
