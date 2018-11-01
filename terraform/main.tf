provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]

  # startup image
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # network config
  network_interface {
    # set network for interface
    network = "default"

    # set ephemeral external IP
    access_config {}
  }

  # ssh keys
  metadata {
    ssh-keys               = "appuser:${file(var.public_key_path)}"
    block-project-ssh-keys = false
  }

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # rules will be applied to this networks
  network = "default"

  # rules
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # inbound ip
  source_ranges = ["0.0.0.0/0"]

  # rules will be applied to this tags
  target_tags = ["reddit-app"]
}

resource "google_compute_project_metadata" "ssh_userkeys" {
  metadata {
    ssh-keys = <<EOF
appuser1:${file(var.public_key_path1)}
appuser2:${file(var.public_key_path2)}
EOF
  }
}
