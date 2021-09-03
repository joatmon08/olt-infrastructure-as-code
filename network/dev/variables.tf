variable "region" {
  type        = string
  description = "GCP region"
}

variable "team" {
  type        = string
  description = "team for resources"
}

variable "environment" {
  type        = string
  description = "environment of resources"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block of subnet"
}

locals {
  name = "${var.team}-${var.environment}"
}