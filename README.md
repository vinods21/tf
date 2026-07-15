# Terraform GCP GitHub Actions Demo

This repo is a small but production-shaped Terraform starter for a GitHub Actions demo on Google Cloud Platform.

## What it includes

- A one-time `bootstrap/` stack to create the remote Terraform state bucket in GCS.
- Three environment roots: `envs/dev`, `envs/stage`, and `envs/prod`.
- One reusable module for a GCS bucket.
- A GitHub Actions workflow for `fmt`, `validate`, `plan`, and `apply`.
- Workload Identity Federation friendly design for keyless GCP auth.

## Suggested flow

1. Run the `bootstrap/` stack once to create the state bucket.
2. Fill in each environment's `terraform.tfvars`.
3. Configure GitHub Actions variables for WIF and the deploy service account.
4. Use PRs for plan checks and GitHub environment protection rules for stage and prod applies.

## Quick start

```bash
cd bootstrap
terraform init
terraform apply -var-file=terraform.tfvars.example

cd ../envs/dev
terraform init -backend-config=backend.hcl
terraform plan
```

## GitHub Actions variables

Create these as repository variables or environment variables:

- `GCP_WIF_PROVIDER`
- `GCP_TF_SERVICE_ACCOUNT`

Then protect the `stage` and `prod` GitHub environments with required reviewers.

## Repo layout

```text
bootstrap/
envs/
modules/
.github/workflows/
```

## Notes

- The demo intentionally uses a simple GCS bucket per environment.
- Bucket names are globally unique, so you will need to choose values that fit your GCP project naming.
- The root stack grants the Terraform/GitHub Actions service account bucket IAM access so the demo can show both infra provisioning and IAM.
