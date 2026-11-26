variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

variable "index_document" {
  description = "Index document for the static website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for the static website"
  type        = string
  default     = "404.html"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
