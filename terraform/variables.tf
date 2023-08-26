variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "service_account_key_file" {
  description = "key.json"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-b"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "image_id" {
  description = "Disk Image"
}
variable "subnet_id" {
  description = "Subnet"
}

variable "instance_count" {
  description = "instance count"
  type        = number
  default     = 3

}
