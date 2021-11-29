provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
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
    yor_trace            = "9f443ae6-98d2-438c-96a6-81b4b1dcaa78"
  }
}

resource "aws_instance" "web_instance" {
  ami             = "ami-0567e0d2b4b2169ae"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    git_commit           = "d286fb5ca4caa63ef62c5116f6535513ba4e91ae"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-29 05:37:47"
    git_last_modified_by = "murali@banyandata.com"
    git_modifiers        = "murali"
    git_org              = "bds1959"
    git_repo             = "terragoat"
    yor_trace            = "e493a875-d4fe-4d9b-b42e-1f92739d1525"
  }
}
