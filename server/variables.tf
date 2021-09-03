variable "name" {
  type        = string
  description = "name of compute instance"
}

variable "zone" {
  type        = string
  description = "GCP zone"
}

variable "machine_type" {
  type        = string
  description = "machine type for compute instance"
  default     = "e2-micro"
}

variable "startup_script" {
  type        = string
  description = "startup_script for compute instance"
  default     = null
}

data "google_compute_image" "ubuntu" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}

variable "network_name" {
  type        = string
  description = "network name to create instance on"
}

variable "tags" {
  type        = map(string)
  description = "map of tags to label instance"
}

variable "network_tags" {
  type        = list(string)
  description = "list of network tags"
  default     = []
}