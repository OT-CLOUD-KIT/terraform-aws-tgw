resource "random_string" "this" {
  length  = 9
  upper   = false
  special = false
  numeric = false
}
locals {
  id = random_string.this.result
  # transit_gateway_route_table_propagations = [
  #     {
  #       name="foo-${local.id}",
  #       transit_gateway_attachment_id = "sdsdsd"
  #       transit_gateway_route_table_id = "sdsdsds"
  #     },
  #     {
  #       name="bar-${local.id}",
  #       transit_gateway_attachment_id = "sdsdsssdsd"
  #       transit_gateway_route_table_id = "sdsdsdsdsds"

  #     }

  #   ]
  #route_table = { for route_table in local.transit_gateway_route_table_propagations : route_table.name => route_table }
    vpc_attachments = [
    {
      # name used as for_each key
      name                                            = "customer-vpc-${local.id}"
      subnet_ids                                      = ["subnet-0320b3f11f99aea51"]
      vpc_id                                          = "vpc-0c91a42b23ddaf449"
      appliance_mode_support                          = "disable"
      dns_support                                     = "enable"
      ipv6_support                                    = "disable"
      tags                                            = {}
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
    },
    {
      name                                            = "security-vpc-${local.id}"
      subnet_ids                                      = ["subnet-0173144909361d3c7"]
      vpc_id                                          = "vpc-0c97b01f614c83e68"
      appliance_mode_support                          = "disable"
      dns_support                                     = "enable"
      ipv6_support                                    = "disable"
      tags                                            = {}
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
    },
  ]
  testing = { for attachment in local.vpc_attachments : attachment.name => attachment }  
  #   route_tables = [
  #     {
  #       # name used as for_each key
  #       name               = "customer-vpc-${local.id}"
  #       transit_gateway_id = "tgw-aasdadsas"
  #       tags               = {}
  #     },
  #     {
  #       name               = "security-vpc-${local.id}"
  #       transit_gateway_id = "tgw-aasdadsas"
  #       tags               = {}
  #     },
  #   ]
  #   route_tables1 = { for route_table in local.route_tables : route_table.name => route_table }
  #   route_table_associations = [for route_table_associations in local.route_tables1 : route_table_associations ]
  # route_table_associations = [
  #   {
  #     rtb_name = "customer-vpc-${local.id}"
  #     transit_gateway_attachment_id = "sdsfdfsd"
  #     transit_gateway_route_table_id = "dssdfsdf"
  #     propagation_transit_gateway_attachment_ids = ["asdfgh"]
  #     propagation_enable = true
  #   },
  #   {
  #     rtb_name = "security-vpc-${local.id}"
  #     transit_gateway_attachment_id = "fgfgfg"
  #     transit_gateway_route_table_id = "ertetrt"
  #     propagation_enable = true
  #     propagation_transit_gateway_attachment_ids = ["sdsfdfsd","weerytyrtyr"]
  #   },
  # ]
  # propagation =  { for k, v in local.route_table_associations : k => v if try(v.propagation_enable, true) == true } 
  # propagation1 = { for propagation2 in local.propagation : propagation2.rtb_name => propagation2 }
  # propagation5 = { for route_table in local.route_table_associations : route_table.rtb_name => route_table }
  # testing = flatten([for member, value in local.propagation5 : [for s in value.propagation_transit_gateway_attachment_ids : {
  #   rtb_name = member
  #   transit_gateway_route_table_id = value.transit_gateway_route_table_id
  #   propagation_transit_gateway_attachment_ids = s
  # }]])
  # propagation3 = { for propagation4 in local.testing : propagation4.propagation_transit_gateway_attachment_ids => propagation4 }
  # # testing = [ for s in local.propagation1 : [
  # #   for d in s.propagation_transit_gateway_attachment_ids : d 
  # # ]]


}

output "route_table" {
  value = local.testing
}