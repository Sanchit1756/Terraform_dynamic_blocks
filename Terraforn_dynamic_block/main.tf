resource "aws_security_group" "asg" {
    name = "sggroup"
    

dynamic "ingress" {
    for_each = var.sg_group
    iterator = port 
   content {
       from_port = port.value
       to_port = port.value
       protocol = "tcp"
       cidr_block = ["0.0.0.0/0"]

   }
}

dynamic "egress" {
    for_each = var.sg_group
    iterator = port 
   content {
       from_port = port.value
       to_port = port.value
       protocol = "tcp"
       cidr_block = ["0.0.0.0/0"]
   }
}
   tag {
    Name = locals.name
}

}