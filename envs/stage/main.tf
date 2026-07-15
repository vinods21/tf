provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  common_labels = {
    app        = var.app_name
    env        = var.environment
    managed_by = "terraform"
    owner      = var.owner
  }

  bucket_name = "${var.project_id}-${var.environment}-${var.bucket_suffix}"
}

module "bucket" {
  source = "../../modules/gcs_bucket"

  name                      = local.bucket_name
  project_id                = var.project_id
  location                  = var.region
  labels                    = local.common_labels
  versioning_enabled        = true
  lifecycle_delete_age_days = var.lifecycle_delete_age_days
  force_destroy             = var.force_destroy
}

resource "google_storage_bucket_iam_member" "terraform_sa_object_admin" {
  bucket = module.bucket.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${var.terraform_service_account_email}"
}
