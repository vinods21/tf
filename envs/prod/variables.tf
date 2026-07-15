variable "project_id" {
  description = "GCP project for this environment."
  type        = string
}

variable "region" {
  description = "Region for the environment resources."
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Environment name."
  type        = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "environment must be dev, stage, or prod."
  }
}

variable "app_name" {
  description = "Short application name used in naming."
  type        = string
  default     = "tf-demo"
}

variable "owner" {
  description = "Label for the owning team or group."
  type        = string
  default     = "platform"
}

variable "bucket_suffix" {
  description = "Suffix for the environment bucket name."
  type        = string
  default     = "assets"
}

variable "terraform_service_account_email" {
  description = "Service account used by GitHub Actions / Terraform."
  type        = string
}

variable "lifecycle_delete_age_days" {
  description = "Delete old objects after this many days."
  type        = number
}

variable "force_destroy" {
  description = "Allow bucket destruction in lower environments."
  type        = bool
  default     = false
}

