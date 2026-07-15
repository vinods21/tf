variable "name" {
  description = "Globally unique bucket name."
  type        = string
}

variable "project_id" {
  description = "Project that owns the bucket."
  type        = string
}

variable "location" {
  description = "GCP region or multi-region for the bucket."
  type        = string
}

variable "labels" {
  description = "Labels applied to the bucket."
  type        = map(string)
  default     = {}
}

variable "versioning_enabled" {
  description = "Whether object versioning is enabled."
  type        = bool
  default     = true
}

variable "lifecycle_delete_age_days" {
  description = "Delete objects after this many days."
  type        = number
}

variable "force_destroy" {
  description = "Allow bucket deletion even when it contains objects."
  type        = bool
  default     = false
}

