variable "instancetags" {
    type = map(string)
}

variable "instancecount" {
    type = number
    default = 2
}

variable "bucket_name" {
    type = map
}