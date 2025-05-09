provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

resource "google_compute_instance" "caeli-engine" {
    name = var.vm_core_name
    machine_type = var.vm_core_type
    zone = var.zone

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }

    network_interface {
        network = "default"
        access_config { }
    }

    metadata = {
        "vm_id" = "core vm"
    }

    metadata_startup_script = <<-EOF
        #!/bin/bash
        echo "VM creada bajo el influjo de $(date)" >> /var/log/Caeli.log
        apt-get update && apt-get install -y python3
    EOF

}