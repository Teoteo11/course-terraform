/* module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server-sg"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-09e02fd5ddfd62e2d"
  ingress_cidr_blocks = ["0.0.0.0/0"]
}         */