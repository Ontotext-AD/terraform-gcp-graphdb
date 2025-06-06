provider "google" {
  project = var.project_id
}

resource "google_compute_instance" "graphdb" {
  name         = var.goog_cm_deployment_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      # The boot disk must be set to the variable declared in Producer Portal
      image = var.source_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  network_interface {
    network = var.network_interface

    access_config {
      // Ephemeral public IP
    }
  }

  # Block the usage of project-level SSH keys
  metadata = {
    block-project-ssh-keys = true
  }

  # Enable VTPM module
  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  tags = [var.goog_cm_deployment_name]
}

resource "google_compute_firewall" "rules" {
  name        = "${var.goog_cm_deployment_name}-graphdb-allow-ingress"
  network     = var.network_interface
  description = "Allow inbound access to GraphDB"

  allow {
    protocol = "tcp"
    ports    = ["7200"]
  }

  source_ranges = var.allowed_ingress_cidrs
  target_tags   = [var.goog_cm_deployment_name]
}
