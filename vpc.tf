resource "aws_vpc" "default" {
    cidr_block = var.vpc_cider
    tags = {
      Name = "default"
    }
  }
  resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.default.id
    cidr_block = var.dev_cider
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = "true"
    tags = {
      "Name" = "default-dev "
    }
  }

  resource "aws_subnet" "devop" {
    vpc_id = aws_vpc.default.id
    cidr_block = var.devop_cider
    availability_zone = "us-west-2b"
    tags = {
      "Name" = "default-devop"
    }
  }

  resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.default.id
    tags = {
      "Name" = "default-igw"
    }
  }

  resource "aws_route_table" "public" {
    vpc_id = aws_vpc.default.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.default.id
    }
    tags = {
      "Name" ="public-route"
    }
  }
  resource "aws_route_table_association" "public-association" {
    subnet_id = aws_subnet.dev.id
    route_table_id = aws_route_table.public.id
  }

   data "aws_ami" "root" {
     most_recent = true
     owners = ["amazon"]
     filter {
       name = "name"
       values = [ "amzn2-ami-hvm-*-gp2" ]
     }
     filter {
       name = "architecture"
       values = [ "x86_64" ]
     }
   }
  resource "aws_instance" "default" {
    ami = data.aws_ami.root.id
    instance_type = var.instancetype
    count = 2
    subnet_id = aws_subnet.dev.id
    tags = {
      "Name" = "terraform-instance"
    }
    user_data =  file("userdata.sh")
  }