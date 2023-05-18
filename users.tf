resource "aws_iam_user" "myuser" {
    for_each = toset(var.iamusernames)
    name = each.key
}