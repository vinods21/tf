variable "project_id" {
  description = "GCP project that will host the Terraform state bucket."
  type        = string
}

variable "region" {
  description = "Region for the state bucket."
  type        = string
  default     = "us-central1"
}

variable "state_bucket_name" {
  description = "Globally unique name for the Terraform state bucket."
  type        = string
}

