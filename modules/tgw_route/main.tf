resource "aws_ec2_transit_gateway_route" "this" {
  for_each                       = local.routes
  blackhole                      = each.value.blackhole
  destination_cidr_block         = each.value.destination_cidr_block
  transit_gateway_attachment_id  = each.value.dst_tgw_attachment_id
  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
} 