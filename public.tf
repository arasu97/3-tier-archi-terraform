provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
 }
  }
}
resource "aws_instance" "public_instance" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  key_name      = "id_rsa.pub"
  subnet_id     = aws_subnet.public1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.this.id]
  tags = {
    Name = "PublicMachine"  # Set the name you want here
  }
}

resource "aws_security_group" "this" {
  vpc_id      = aws_vpc.this.id


egress {
    cidr_blocks      = ["0.0.0.0/0",]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    self             = false
    to_port          = 0

  }
  ingress {
    cidr_blocks      = ["0.0.0.0/0",]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    to_port          = 22
                                                                                                                            

 }
}
resource "aws_key_pair" "smartwork" {
  key_name   = "id_rsa.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4a+Y/vLqJwSFGSY+Qh9kWluPNa7aIIongaz0eKp7Mhxq2axHA4gRD/IIo0WXkTKI8E5wlgnZp3oqunfw2Py03v4upDevAIJJpMXfY4RgGifua8X/iPFCBVXsHPc88ftObXYoSKuRk0QLCPmzm9fktKojgHhJQ6ZG/7R0/2626Ovb7hGkmVTgs1Fssr2SxyI+4NnF4/LwNJhxqIQi+mf4+BtVq3zxaTBTOg91yRE3dYA6/+bUSGmeHsLOg7pt+z0fulmMj4XMQfMKWgEC00Bwe1pBa9GGGI3xI1UJb3vvOHUe6OWV/MIADOWi3YeEoLaBIwSvuuHu7i8NUwAh9Hc9e3JolZG0ukm5hBugl7DQ12iodAChLuD2ZL6se1+dohIbjMCo98/WyNVp1sH5f9W6sDyXOINJVhlFi2bED90PXkcXlImnZySil1pxAYGGzVNV5RG2bwx6ehSRCaK6olviXO/Cp1QvU2VCOtutGpsciXIl680y4kFcjqpE66ppYiak= ubuntu@ip-172-31-18-66"
}




