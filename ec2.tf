provider "aws" {
  region = "us-east-1"  # your AWS region
}

resource "aws_instance" "example" {
  ami                         = "ami-xxxxxxx"        # Replace with your actual AMI ID
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.my_subnet.id  # Replace with your subnet resource or ID
  associate_public_ip_address = true
  key_name                    = "terraform-key-ITA771"
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

