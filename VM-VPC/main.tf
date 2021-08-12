provider "google" {
  project = "srinu2"
  credentials = file("srinu2-14f292a3a4e3.json")
  region  = "asia-east2-b"
  zone    = "asia-east2-b"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network-8"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance-ink"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      // Ephemeral IP
    }
  }
}

