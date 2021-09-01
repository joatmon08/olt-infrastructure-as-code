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

variable "machine_type" {
  type        = string
  description = "machine type for compute instance"
  default     = "e2-micro"
}

variable "machine_image" {
  type        = string
  description = "machine image for compute instance"
  default     = "ubuntu-1804-lts"
}

variable "labels" {
  type        = map(string)
  description = "additional labels"
  default     = {}
}

locals {
  name = "${var.team}-${var.environment}"
  labels = merge(var.labels, {
    automated   = "Terraform",
    environment = var.environment,
    team        = var.team
  })
}


