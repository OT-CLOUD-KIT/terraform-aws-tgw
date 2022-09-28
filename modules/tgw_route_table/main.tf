resource "aws_ec2_transit_gateway_route_table" "this" {
  for_each           = local.route_tables
  transit_gateway_id = each.value.transit_gateway_id
  tags = merge(
    { "Name" : each.key },
    each.value.tags,
  )
}