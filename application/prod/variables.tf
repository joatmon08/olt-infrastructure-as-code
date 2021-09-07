variable "team" {
  type        = string
  description = "team for resources"
}

variable "environment" {
  type        = string
  description = "environment of resources"
}

variable "network_org" {
  type        = string
  description = "network state store organization"
}

variable "network_workspace" {
  type        = string
  description = "network state store workspace"
}

variable "labels" {
  type        = map(string)
  description = "additional labels"
  default     = {}
}

variable "client_ip_address" {
  type        = string
  description = "Client IP address for external VM access"
  default     = "0.0.0.0/0"
}

locals {
  name = "${var.team}-${var.environment}"
}