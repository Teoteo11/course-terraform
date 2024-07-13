/* first resource: AWS Security Group */
/* resource "aws_security_group" "first" {
  name        = "security_group_terraform_course"
  description = "terraform first resource created ever"
  tags = {
    Name = "terraform-course"
  }
} */

/* 
  terraform state rm aws_security_group.localtest
  import è il comando opposto ad rm
  Voglio togliere il security group da Terraform, non da AWS..perchè voglio lavorarlo manualmente senza codice 
*/

/* module "first_custom_module" {
  source = "./modules/first-custom-module/"
  prefix = "peppemod"
}

resource "aws_security_group" "ssh" {
  name        = "ssh_from_module"
  description = "Allow ssh"


  ingress {
    description      = "ssh from module"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${module.first_custom_module.my_private_ip}/32"]
  }
} */

/*  sg with parameter security ( AWS Security Manager ) */
  /* data "aws_ssm_parameter" "for_count" {
    name = "activate-security"
  }

  resource "aws_security_group" "sg_with_parameter" {
    count = data.aws_ssm_parameter.for_count.value == "true" ? 1 : 0
    name        = "my_sg_with_parameter"
    description = "terraform resource created ever"
    tags = {
      Name = "my name with count"
    }
  } */

/* sg with array */
  /* locals {
    my_array_of_names = ["aldo", "giovanni", "giacomo"]
  }

  resource "aws_security_group" "sg_with_count_array" {
    count = length(local.my_array_of_names)
    name        = "security-group-of-${local.my_array_of_names[count.index]}"
    description = "terraform first resource created ever"
    tags = {
      Name = "security group of ${local.my_array_of_names[count.index]}"
    }
  } */

/*  Dynamic Blocks */
variable "rules" {
  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 3689
      proto       = "tcp"
      cidr_blocks = ["6.7.8.9/32"]
    }
  ]

} 

resource "aws_security_group" "my-sg" {
  name   = "my-dynamic-sg"


  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "Terraform-Dynamic-SG"
  }
}        