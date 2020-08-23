provider "aws"{
    region = "us-east-1"
}

module "s3_bucket"{
    source = ".//modules/s3_bucket"
    acl = "log-delivery-write"
    bucket_name = var.bucket_name
    tags        = { "Owner":"Raghib"}
    force_destroy = true
    website     = { "index_document":"index.html","error_document":"error.html"}
    cors_rule   = { "allowed_headers":"${var.allowed_headers}","allowed_methods":"${var.allowed_methods}",
                    "allowed_origins":"${var.allowed_origins}","expose_headers":"${var.expose_headers}",
                    "max_age_seconds":"3000"}
    versioning  = { "enabled":"true" ,"mfa_delete":"false"}
    logging     = { "target_bucket":"${var.bucket_name}","target_prefix":"/logs/"}
}