resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "cloudfront-access-identity"
}

locals {
  s3_origin_id = "my_awesome_s3_origin"
}

resource "aws_cloudfront_distribution" "web" {
  origin {
    domain_name = module.s3_bucket.s3_bucket_bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  enabled             = true
  is_ipv6_enabled     = false
  default_root_object = "index.html"
  aliases             = []

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https" # other options - https only, http

    forwarded_values {
      headers      = []
      query_string = true

      cookies {
        forward = "all"
      }
    }
  }

  price_class         = "PriceClass_200"

  viewer_certificate {
    cloudfront_default_certificate = true
    acm_certificate_arn            = ""
    minimum_protocol_version       = "TLSv1"
  }

  web_acl_id = aws_waf_web_acl.waf_acl.id
}
