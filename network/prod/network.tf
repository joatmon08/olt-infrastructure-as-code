resource "google_compute_network" "vpc" {
  name                    = local.name
  auto_create_subnetworks = true
}