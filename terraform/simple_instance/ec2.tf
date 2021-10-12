provider "aws" {
  access_key = "AKIAXPXIDEH66NCWVFTP"
  secret_key = "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"
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
    yor_trace            = "ac29ca85-7ff9-4794-a835-6259d0a4bbb0"
  }
}

resource "aws_instance" "web_instance" {
  ami             = "ami-090717c950a5c34d3"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "0ea89d49c8da80c516942548a58bd51101f055e3"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-12 08:44:37"
    git_last_modified_by = "murali@banyandata.com"
    git_modifiers        = "murali"
    git_org              = "bds1959"
    git_repo             = "terragoat"
    yor_trace            = "0a64290e-f8a7-432e-925f-beb407a5da08"
  }
}
