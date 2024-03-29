variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable db_disk_image {
  description = "Disk image for reddit app"
  default = "mongodb-base"
}
variable subnet_id {
description = "Subnets for modules"
}

variable "db_user" {
    description = "username"
    default = "ubuntu"
}

