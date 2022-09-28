#### Transit gateway routetable association resource ##########

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  for_each                       = local.route_table_associations
  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
}
#### Transit gateway routetable propagation resource ##########
resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  for_each                       = { for k, v in local.propagation : k => v }
  transit_gateway_attachment_id  = each.value.propagation_transit_gateway_attachment_ids
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
}
