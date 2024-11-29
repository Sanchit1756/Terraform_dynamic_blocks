variable "var" {
    default = "ap-south-1"
}

variable "sg_ports" {
    type = list(numbers)
    description = "dynamic block for security group"
    default = [ 22, 443, 80, 3389 , 0]
}

