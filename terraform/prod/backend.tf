terraform {


  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "backendstorage"
    region     = "ru-central1-b"
    key        = "./terraform.tfstate"
    access_key = "YCAJEBKz5keteV4JwudM2BHxQ"
    secret_key = "YCNR2kSUHpdXTA0-u5GcE0Zvjp_3gRlaa6smhn_C"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
