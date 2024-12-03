data "aws-ami" "dataami" {
    owner = ["amazon"]
    most_recent = true
    

    filter {
        name = "idami"
        version = ["amzn2-ami-kernel-5.10**"]
    }
}

resource "aws_ami" "demoec2" {
    ami = data.aws_ami.dataami.idami
    instance_type = "t2.micro"
    cidr_block = ["0.0.0.0/16"]


    provisioner "remote-exec" {
        inline = [
            "sudo yum install ngnix",
            "sudo systemctl enable ngnix"
        ]
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("pemfilename or path")
        host = self.public_ip
    }

    provisioner "local-exec" {
        command = "echo $(aws_instance.demoec2.private_ip) >> privateip.txt"
    }

    
}

output "publicip" {
    value = "aws_intance.demoec2.public_ip"

}