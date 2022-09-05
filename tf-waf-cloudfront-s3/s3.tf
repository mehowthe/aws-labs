module "s3_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  bucket_prefix = var.s3_bucket_prefix
  acl           = "private"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "s3_website_config" {
  bucket = module.s3_bucket.s3_bucket_id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#Upload files of your static website
resource "aws_s3_object" "object_index_html" {
  bucket = module.s3_bucket.s3_bucket_id
  key    = "index.html"
  source = "templates/index.html"
  content_type = "text/html"

  etag = filemd5("templates/index.html")
}

data "aws_iam_policy_document" "s3_policy" {
  version = "2012-10-17"
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_bucket.s3_bucket_arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "docs" {
  bucket = module.s3_bucket.s3_bucket_id
  policy = data.aws_iam_policy_document.s3_policy.json
}
