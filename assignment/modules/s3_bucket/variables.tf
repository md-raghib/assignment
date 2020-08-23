variable "bucket_name"{
    description = "name of the bucket"
    type = string
    default = null
}

variable "acl"{
    description = "ACL to apply"
    type = string
    default = "private"
}

variable "tags"{
    description = "Tags to be assigned"
    type = map(string)
    default = {}
}

variable "force_destroy"{
    description = " Set true to force destroy the bucket. Objects are not recoverable"
    type = bool
    default = false
}

variable "website" {
    description = "Details of hosting files"
    type = map(string)
    default = {}
}

variable "cors_rule" {
  description = "Map containing a rule of Cross-Origin Resource Sharing."
  type        = any
  default     = {}
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(string)
  default     = {}
}

variable "logging" {
    description = " logging configuration"
    type        = map(string)
    default     = {}
}