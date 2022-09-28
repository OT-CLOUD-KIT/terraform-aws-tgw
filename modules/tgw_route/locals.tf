locals {
  routes = { for route in var.routes : route.name => route }
}