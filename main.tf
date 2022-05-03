# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
 count = var.instance-count
  name = "instance-${count.index}"
  machine_type = "e2-micro"
  zone = "us-east1-b"
  #name         = "os-patch-config-vm-1"
  #machine_type = "e2-micro"
  #zone         = "us-east1-b"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

      access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "os-config@long-advice-346606.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}