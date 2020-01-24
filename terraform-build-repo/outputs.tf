output "repo_http_clone_url" {
  value = aws_codecommit_repository.TerraformBuildRepo.clone_url_http
}

output "repo_ssh_clone_url" {
  value = aws_codecommit_repository.TerraformBuildRepo.clone_url_ssh
}
