variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app"
}
variable subnet_id {
    description = "Subnets for modules"
}

variable "db_user" {
    description = "username"
    default = "ubuntu"
}
variable "db_url" {
    description = "db url path"
}
