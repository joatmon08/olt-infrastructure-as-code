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