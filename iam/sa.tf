resource "google_service_account" "service_account" {
  account_id   = "${var.team}-github-actions"
  display_name = "${var.team}-github-actions"
}

resource "google_project_iam_member" "compute" {
  project = var.project
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}