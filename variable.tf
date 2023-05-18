variable "az" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "instancetype" {
    type = map(string)
    default = {
      "smallapp" = "t2.micro"
      "mediumapp" = "t3.micro"
      "largeapp" = "t2.small"
    }
}

variable "instancetags" {
    type = map(string)
    default = {
      "name" = "myec2vm"
      "tier" = "web"
    }
  
}

# variable "amiid" {
#     type = string
#     default = "ami-047a51fa27710816e"
#     validation {
#         condition = length(var.amiid) > 4 && substr(var.amiid, 0, 4) == "ami-"
#         error_message = "The ec2_ami_id value must be a valid AMI Id, starting with \"ami-\"."
#     }
# }

# variable "instancecount" {
#     type = number
#     default = 2
# }

variable "iamusernames" {
    type = list(string)
    default = [ "Jack", "Jill" ]
  
}

variable "bucket_name" {
    type = map
    default = {
        dev = "mydevbucket",
        qa = "myqabucket",
        prod = "myprodbucket"
        
    }
}


variable "dbusername" {
  type = string
  sensitive = true
}

variable "dbpassword" {
    type = string
    sensitive = true
}

variable "package_name" {
  type = string
  default = "httpd"
}