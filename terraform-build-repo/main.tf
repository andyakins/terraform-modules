resource "aws_codecommit_repository" "TerraformBuildRepo" {
  repository_name = var.repo_name
  description     = var.repo_description
}
