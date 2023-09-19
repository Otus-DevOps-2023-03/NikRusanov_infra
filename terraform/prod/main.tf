#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "0.96"
#    }
#  }
#}


provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}


module "vpc" {
  source = "../modules/vpc"
}

module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  app_disk_image   = var.app_disk_image
  db_user          = var.db_user
  db_url           = module.db.external_ip_address_db
  subnet_id        = module.vpc.app_subnet_id
}

module "db" {
  source           = "../modules/db"
  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path
  db_disk_image    = var.db_disk_image
  db_user          = var.db_user
  subnet_id        = module.vpc.app_subnet_id
}
