/* create instance EC2 */
/* resource "aws_instance" "first" {
  ami           = data.aws_ami.last_ubuntu.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.first.id]
  tags = {
    Name = "EC2 with terraform"
  }
} */