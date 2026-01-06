# Atlantis Terraform Demo with Atmos

This repository demonstrates how to use Atlantis for automated Terraform PR workflows with Atmos.

## What is Atlantis?

Atlantis is a tool that automates Terraform workflows via Pull Requests:
- Automatically runs `terraform plan` when you open a PR
- Lets you review infrastructure changes in the PR comments
- Runs `terraform apply` when you comment `atlantis apply`
- Provides locking to prevent concurrent modifications

## Repository Structure

```
.
├── atlantis.yaml              # Atlantis configuration
├── atmos.yaml                 # Atmos configuration
├── components/
│   └── terraform/
│       └── s3-bucket/        # S3 bucket Terraform module
│           ├── main.tf
│           └── versions.tf
└── stacks/
    ├── globals.yaml          # Global configuration
    ├── dev.yaml              # Dev environment config
    └── staging.yaml          # Staging environment config
```

## How It Works

1. **Open a PR** - Make changes to Terraform code or stack configs
2. **Atlantis plans** - Automatically runs `terraform plan` and comments results
3. **Review** - Team reviews the plan in PR comments
4. **Approve PR** - Required before applying
5. **Apply** - Comment `atlantis apply` to run `terraform apply`

## Atlantis Commands

Use these commands in PR comments:

- `atlantis plan` - Run plan manually
- `atlantis apply` - Apply changes (requires PR approval)
- `atlantis plan -p s3-bucket-dev` - Plan specific project
- `atlantis apply -p s3-bucket-dev` - Apply specific project
- `atlantis unlock` - Unlock if stuck

## Environments

- **dev** - Development environment
- **staging** - Staging environment
- **production** - Production environment

Each environment is defined in `stacks/*.yaml` and uses the same Terraform components.
# Testing Atlantis with ngrok
