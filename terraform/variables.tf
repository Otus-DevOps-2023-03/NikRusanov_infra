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

variable "bucket_name" {
  description = "storage bucket name"
}

variable "access_key" {
  description = "access key for storage bucket"
}

variable "secret_key" {
  description = "secret key for storage bucket"
}
