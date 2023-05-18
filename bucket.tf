resource "aws_s3_bucket" "mybucket" {
    for_each = var.bucket_name
    bucket = "${each.key}-${each.value}"
}

resource "aws_s3_bucket_ownership_controls" "mybucketownership" {
    for_each = var.bucket_name
    bucket = aws_s3_bucket.mybucket[each.key].id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "mybucketacl" {
    depends_on = [ aws_s3_bucket_ownership_controls.mybucketownership ]
    for_each = var.bucket_name
    bucket = aws_s3_bucket.mybucket[each.key].id
    acl = "private"
}