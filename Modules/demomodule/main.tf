data "aws_ami" "amiid" {
    owner = ["amazon"]
    latest = true

    filter {
        name = "amazon_id"
        version = ["amzn2-ami-kernel-5.10**"]
        
    }
}

resourec "aws_instance" "demo" {
    ami = data.aws_ami.amiid.id
    key = "demo.pem"
    instance_type = "t2.micro"
    cidr_block =  ["0.0.0.0/0"]

}