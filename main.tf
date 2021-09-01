terraform {
  required_version = ">=1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.82"
    }
  }
}


data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = var.network_org
    workspaces = {
      name = var.network_workspace
    }
  }
}


provider "google" {
  region = data.terraform_remote_state.vpc.outputs.region
}

data "google_compute_zones" "available" {}

data "google_compute_network" "vpc" {
  name = local.name
}

module "tags" {
  source      = "./tag"
  team        = var.team
  environment = var.environment
}

module "server" {
  source       = "./server"
  name         = local.name
  zone         = data.google_compute_zones.available.names.0
  network_name = data.google_compute_network.vpc.name
  tags         = merge(var.labels, module.tags.gcp)
}