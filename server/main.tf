terraform {
  required_version = ">=1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=3.82"
    }
  }
}

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


resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  metadata_startup_script = var.startup_script

  network_interface {
    network = var.network_name
    access_config {
      network_tier = "STANDARD"
    }
  }

  labels            = var.tags
  tags              = var.network_tags
  metadata          = {}
  resource_policies = []
}