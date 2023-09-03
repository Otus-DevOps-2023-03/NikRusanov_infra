terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.96"
    }
  }
}
resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  labels = {
    tags = "reddit-db"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = var.db_user
    agent       = false
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
        content     = templatefile("${path.module}/files/change_ip.sh", { ip = self.network_interface.0.ip_address })
        destination = "/tmp/change_ip.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/change_ip.sh",
      "sudo /tmp/change_ip.sh"
    ]
  }
}
