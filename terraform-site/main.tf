data "aws_caller_identity" "CallerID" {}

resource "aws_codecommit_repository" "SiteRepo" {
  repository_name = "${var.site_name}-site"
  description     = "Repository for code/resources for the ${var.site_name} site."
}

resource "aws_s3_bucket" "PublicBucket" {
  bucket        = "${var.site_name}.${var.domain_extension}"
  acl           = "public-read"
  force_destroy = true
  region        = var.region
  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "PublicBucket" {
  bucket = aws_s3_bucket.PublicBucket.id
  policy = templatefile("${path.module}/public-bucket-policy.tmpl", { bucket_name = "${var.site_name}.${var.domain_extension}", user_arn = data.aws_caller_identity.CallerID.arn })
}

resource "aws_s3_bucket" "WWWBucket" {
  bucket        = "www.${var.site_name}.${var.domain_extension}"
  acl           = "public-read"
  force_destroy = true
  region        = var.region
  website {
    redirect_all_requests_to = aws_s3_bucket.PublicBucket.id
  }
}

resource "aws_route53_zone" "DomainDNS" {
  name = "${var.site_name}.${var.domain_extension}."
}
