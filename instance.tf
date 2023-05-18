module "awsec2instancewitheip" {
    source  = "app.terraform.io/DarshanDanani/ec2-with-eip/aws"
    version = "1.0.1"
    subnetid = aws_subnet.mysubnet.id
    tags = var.instancetags
}

output "moduleattributereference" {
    value = module.awsec2instancewitheip.instancepublicip
}