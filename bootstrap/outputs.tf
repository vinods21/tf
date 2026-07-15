output "state_bucket_name" {
  value       = google_storage_bucket.tfstate.name
  description = "Name of the Terraform state bucket."
}

