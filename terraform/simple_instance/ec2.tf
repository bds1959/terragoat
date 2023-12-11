provider "aws" {
  access_key = "$aws_access_key_id"
  secret_key = "$aws_secret_access_key"
  region     = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "af437ea563d82ecfe6527683d243ba4d6f1aa563"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-12 04:05:55"
    git_last_modified_by = "murali@banyandata.com"
    git_modifiers        = "murali"
    git_org              = "bds1959"
    git_repo             = "terragoat"
    yor_trace            = "5690d8f5-356b-4a1f-ba43-81cb21b7880e"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"

  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "af437ea563d82ecfe6527683d243ba4d6f1aa563"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-12 04:05:55"
    git_last_modified_by = "murali@banyandata.com"
    git_modifiers        = "murali"
    git_org              = "bds1959"
    git_repo             = "terragoat"
    yor_trace            = "33648582-045b-4d1f-be5a-114317b230e5"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["514809078269"] # Canonical
}
