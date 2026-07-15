output "bucket_name" {
  value       = module.bucket.name
  description = "Environment bucket name."
}

output "bucket_url" {
  value       = module.bucket.url
  description = "Environment bucket URL."
}

output "terraform_service_account_email" {
  value       = var.terraform_service_account_email
  description = "Terraform service account used in this environment."
}

# Intentional no-op change to exercise the PR pipeline.
