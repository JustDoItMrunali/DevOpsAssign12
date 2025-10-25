########################################
# MRUNALI DEVOPS INFRA - ITB745 (NO EIP VERSION)
########################################

# 1️⃣ Generate SSH Key Pair
resource "tls_private_key" "mru_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "mru_key" {
  key_name   = "mru-key"
  public_key = tls_private_key.mru_key.public_key_openssh
}

# Save PEM file to local directory
resource "local_file" "mru_key_pem" {
  content  = tls_private_key.mru_key.private_key_pem
  filename = "${path.module}/../mru-key.pem"
}

########################################
# 2️⃣ Security Group
########################################
resource "aws_security_group" "mru_sg" {
  name_prefix = "mru-sg-"
  description = "Allow SSH, HTTP, HTTPS, and Docker Swarm Ports"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Docker Swarm"
    from_port   = 2377
    to_port     = 2377
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Swarm Node Communication"
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Overlay Network"
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################################
# 3️⃣ Common Variables
########################################
locals {
  instance_type = "t2.micro"
  ami_id        = "ami-0fc5d935ebf8bc3bc" # Ubuntu 20.04 LTS - us-east-1
}

########################################
# 4️⃣ EC2 Instances (Auto-assign Public IPs)
########################################

resource "aws_instance" "mru_controller" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  key_name               = aws_key_pair.mru_key.key_name
  vpc_security_group_ids = [aws_security_group.mru_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "mru-controller-ITB745"
  }
}

resource "aws_instance" "mru_manager" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  key_name               = aws_key_pair.mru_key.key_name
  vpc_security_group_ids = [aws_security_group.mru_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "mru-manager-ITB745"
  }
}

resource "aws_instance" "mru_worker_a" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  key_name               = aws_key_pair.mru_key.key_name
  vpc_security_group_ids = [aws_security_group.mru_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "mru-worker-a-ITB745"
  }
}

resource "aws_instance" "mru_worker_b" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  key_name               = aws_key_pair.mru_key.key_name
  vpc_security_group_ids = [aws_security_group.mru_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "mru-worker-b-ITB745"
  }
}
