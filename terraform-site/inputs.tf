variable "domain_extension" {
  description = "The extension for the site's domain."
  default     = "com"
}

variable "site_name" {
  description = "The name of the CodeCommit repository created."
}

variable "region" {
  description = "The region to deploy the site into."
  default     = "us-east-1"
}
