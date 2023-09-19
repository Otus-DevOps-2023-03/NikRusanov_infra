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

variable "subnet_id" {
  description = "Subnet"
}

variable "db_disk_image" {
  description = "db disk image id"
}

variable "app_disk_image" {
  description = "app disk image id"
}

variable "instance_count" {
  description = "instance count"
  type        = number
  default     = 1
}

variable "db_user" {
  description = "Database connection user"
  default     = "ubuntu"
}
