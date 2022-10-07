resource "aws_key_pair" "web_admin" {
  key_name   = "web_admin"
  public_key = file("web_admin.pub")
}

resource "aws_security_group" "ssh" {
  description = "Allow SSH port from all"
  name        = "allow_ssh_from_all"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_security_group" "default" {
  name = "default"
}

# https://docs.aws.amazon.com/AL2/latest/relnotes/relnotes-al2.html
# resource "aws_instance" "web" {
#   ami           = "ami-0c76973fbe0ee100c" # amazon/amzn2-ami-kernel-5.10-hvm-2.0.20220912.1-x86_64-gp2
#   instance_type = "t2.micro"
#   key_name      = aws_key_pair.web_admin.key_name
#   vpc_security_group_ids = [
#     aws_security_group.ssh.id,
#     data.aws_security_group.default.id
#   ]
# }

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/spot_instance_request
resource "aws_spot_instance_request" "cheap_worker" {
  ami           = "ami-0c76973fbe0ee100c" # amazon/amzn2-ami-kernel-5.10-hvm-2.0.20220912.1-x86_64-gp2
  instance_type = "t2.micro"
  spot_price    = "0.03"

  key_name      = aws_key_pair.web_admin.key_name
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    data.aws_security_group.default.id
  ]

  tags = {
    Name = "CheapWorker"
  }
}