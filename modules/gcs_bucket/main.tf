resource "google_storage_bucket" "this" {
  name     = var.name
  project  = var.project_id
  location = var.location

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = var.force_destroy
  labels                      = var.labels

  versioning {
    enabled = var.versioning_enabled
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = var.lifecycle_delete_age_days
    }
  }
}

