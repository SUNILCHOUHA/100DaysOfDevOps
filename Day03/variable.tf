variable "ami_id" {
    default = "ami-0ecb62995f68bb549"
    type = string
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "root_block_device" {
    default = 10
    type = number
}

