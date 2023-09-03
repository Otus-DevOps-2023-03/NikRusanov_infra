output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}

output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

output "db_ip_address" {
  value = module.db.ip_address_db
}

output "app_ip_address" {
  value = module.app.ip_address_app
}

output "app_subnet_id" {
  value = module.vpc.app_subnet_id
}
#output "external_ip_address_lb" {
#    value = yandex_lb_network_load_balancer.lb.listener.*.external_address_spec[0].*.address
#}
