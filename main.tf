terraform {
  required_version = ">=1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.82"
    }
  }
}


provider "google" {
  region = var.region
}


data "google_compute_zones" "available" {}

resource "google_compute_network" "vpc" {
  name = local.name
}

resource "google_compute_instance" "vm" {
  name         = local.name
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available.names.0

  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }


  network_interface {
    network = google_compute_network.vpc.name
    access_config {
      network_tier = "STANDARD"
    }
  }

  labels = local.labels
}