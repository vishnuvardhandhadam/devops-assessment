data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {

  ami                    = data.aws_ami.ubuntu.id

  instance_type          = var.instance_type

  key_name               = var.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "DevOps-Assessment"
  }

}