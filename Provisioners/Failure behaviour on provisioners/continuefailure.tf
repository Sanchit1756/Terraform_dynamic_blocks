resource "aws_instance" "aws1" {
    
    provisioners "local-exec" {
        command = "echo The private ip of instance is $(self.private_ip)"
        //on_failure is use to decide weather after provisioner failure we have to continue with remaining code for infra
        on_failure = continue
    }
}

