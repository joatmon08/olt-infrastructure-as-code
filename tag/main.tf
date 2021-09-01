terraform {
  required_version = ">=1.0"
}

variable "team" {
  type        = string
  description = "team name"
}

variable "environment" {
  type        = string
  description = "environment"
}

output "gcp" {
  value = {
    automated   = "terraform",
    environment = var.environment,
    team        = var.team
  }
}