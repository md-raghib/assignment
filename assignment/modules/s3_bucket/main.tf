resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = var.acl

  tags = var.tags
  force_destroy = var.force_destroy
  policy = data.aws_iam_policy_document.website_policy.json

  dynamic "website" {
      for_each = length(keys(var.website)) == 0 ? [] : [var.website]

      content {
          index_document    = lookup(website.value,"index_document",null)
          error_document    = lookup(website.value,"error_document",null)

      }
  }

  dynamic "cors_rule" {
    for_each = length(keys(var.cors_rule)) == 0 ? [] : [var.cors_rule]

    content {
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      allowed_headers = lookup(cors_rule.value, "allowed_headers", null)
      expose_headers  = lookup(cors_rule.value, "expose_headers", null)
      max_age_seconds = lookup(cors_rule.value, "max_age_seconds", null)
    }
  }

  dynamic "versioning" {
    for_each = length(keys(var.versioning)) == 0 ? [] : [var.versioning]

    content {
      enabled    = lookup(versioning.value, "enabled", null)
      mfa_delete = lookup(versioning.value, "mfa_delete", null)
    }
  }
  dynamic "logging" {
    for_each = length(keys(var.logging)) == 0 ? [] : [var.logging]

    content {
      target_bucket = logging.value.target_bucket
      target_prefix = lookup(logging.value, "target_prefix", null)
    }
  }



}