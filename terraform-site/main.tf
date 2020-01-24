resource "aws_codecommit_repository" "SiteRepo" {
  repository_name = "${var.site_name}-site"
  description     = "Repository for code/resources for the ${var.site_name} site."
}

resource "aws_s3_bucket" "PublicBucket" {
  bucket = "${var.site_name}.${var.domain_extension}"
  acl    = "public-read"
  policy = templatefile("${path.module}/public-bucket-policy.tmpl", { bucket_name = "${var.site_name}.${var.domain_type}" })
  region = var.region
  website {
    index_document = "index.html"
  }
}
