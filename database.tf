resource "aws_db_instance" "mydb" {
    allocated_storage = 5
    engine = "mysql"
    instance_class = "db.t2.micro"
    username = var.dbusername
    password = var.dbpassword
    skip_final_snapshot = true
    db_name = "mydb"
}

output "dbuser" {
    value = var.dbusername
    sensitive = true
}

output "dbsg" {
    value = aws_db_instance.mydb.vpc_security_group_ids
    sensitive = true
}