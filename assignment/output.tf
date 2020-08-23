output "s3_bucket_name" {
    value = "${module.s3_bucket.s3_bucket_id}"
}
output "s3_bucket_arn" {
    value = "${module.s3_bucket.s3_bucket_arn}"
}
output "website_endpoint" {
    value = "${module.s3_bucket.s3_bucket_website_endpoint}"
}
output "website_domain" {
    value = "${module.s3_bucket.s3_bucket_website_domain}"
}