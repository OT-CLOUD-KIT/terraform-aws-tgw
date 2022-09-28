#### Transit gateway attachment resource ##########

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  for_each           = local.vpc_attachments
  subnet_ids         = each.value.subnet_ids
  transit_gateway_id = each.value.transit_gateway_id
  vpc_id             = each.value.vpc_id
  # appliance_mode_support = try(each.value.appliance_mode_support, false) ? "enable" : "disable"
  # dns_support            = try(each.value.dns_support, true) ? "enable" : "disable"
  # ipv6_support           = try(each.value.ipv6_support, false) ? "enable" : "disable"
  appliance_mode_support = each.value.appliance_mode_support
  dns_support            = each.value.dns_support
  ipv6_support           = each.value.ipv6_support
  tags = merge(
    { "Name" : each.key },
    each.value.tags,
  )

  # default assocation and propagation values must be:
  #   `true` if transit gateway is owned by another account (shared using RAM)
  #   `false` if the transit gateway has no default route table (== "disable")
  transit_gateway_default_route_table_association = (
  var.cross_account) ? true : (try(each.value.transit_gateway_default_route_table_association, true))

  transit_gateway_default_route_table_propagation = (
  var.cross_account) ? true : (try(each.value.transit_gateway_default_route_table_propagation, true))
}
