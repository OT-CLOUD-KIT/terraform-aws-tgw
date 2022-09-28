locals {
  route_table_associations = { for route_table_associations in var.route_table_associations : route_table_associations.rtb_name => route_table_associations }
  #sort_enable_propagation  = { for k, v in local.route_table_associations : k => v if try(v.propagation_enable, true) == true }
  #propagation              = { for propagation in local.sort_enable_propagation : propagation.rtb_name => propagation }
  propagation = flatten([for key, value in local.route_table_associations : [for s in value.propagation_transit_gateway_attachment_ids : {
    rtb_name = key
    transit_gateway_route_table_id = value.transit_gateway_route_table_id
    propagation_transit_gateway_attachment_ids = s
  }]])
  #final_propagations = { for propagation4 in local.testing : propagation4.propagation_transit_gateway_attachment_ids => propagation4 }
}
