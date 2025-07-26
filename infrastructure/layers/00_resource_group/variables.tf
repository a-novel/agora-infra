variable "region" {
  type        = string
  description = "Name of the AWS region to use (ex : eu-west-1)"
}

variable "app_name" {
  type        = string
  description = "Code of the project to use for naming"
}

variable "environment" {
  type        = string
  description = "Environment to deploy (ex : dev)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources in this module"
  default     = {}
}
