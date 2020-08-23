variable "bucket_name"{
    description = "name of the bucket"
    type = string
    default = "sampleqwertbucket"
}

variable "allowed_headers"{
    description = " allowed headers"
    type = list(string)
    default = ["*"]
}
variable "allowed_methods"{
    description = " allowed methods for CORS"
    type = list(string)
    default = ["PUT","POST"]
}
variable "allowed_origins"{
    description = " allowed origins"
    type = list(string)
    default = ["http://sampleqwertbucket"]
}
variable "expose_headers"{
    description = " expoed headers "
    type = list(string)
    default = ["ETag"]
}