variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "s3_bucket_prefix" {
  type = string
  default = "lab-waf-cdn-s3"
}
