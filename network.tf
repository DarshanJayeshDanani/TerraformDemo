resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "myroutetable" {
    vpc_id = aws_vpc.myvpc.id
}

resource "aws_route" "myroute" {
    route_table_id = aws_route_table.myroutetable.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
}

resource "aws_route_table_association" "myroutetableassociation" {
    subnet_id = aws_subnet.mysubnet.id
    route_table_id = aws_route_table.myroutetable.id
}


resource "aws_security_group" "mydefaultsg" {
  name        = "mysg-${terraform.workspace}"
  description = "Dev VPC Default Security Group"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}