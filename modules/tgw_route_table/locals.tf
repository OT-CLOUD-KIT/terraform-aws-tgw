locals {
  route_tables = { for route_table in var.route_tables : route_table.name => route_table }
}
