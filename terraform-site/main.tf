resource "aws_codecommit_repository" "SiteRepo" {
  repository_name = "${var.site_name}-site"
  description     = "Repository for code/resources for ${var.site_name} site."
}
