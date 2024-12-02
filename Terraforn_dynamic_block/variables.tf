variable "var" {
    default = "ap-south-1"
}

variable "sg_ports" {
    type = list(numbers)
    description = "dynamic block for security group"
    default = [ 22, 443, 80, 3389 , 0]
}

variable "sg_ports_map" {
    type = map(object({
        from_port = number,
        to_port = number,
        protocol = string,
        cidr_block = list(string)
    }))
    default = [
        from_port = 443 ,to_port = 80.value ,protocol = "tcp" ,cidr_block = ["0.0.0.0/0"],
        from_port = 8080 ,to_port = 224.value ,protocol = "tcp" ,cidr_block = ["0.0.0.0/0"],
    ]
}
