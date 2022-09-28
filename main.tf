# module "tgw" {
#   source      = "./modules/tgw"
#   description = "Provision TGW"
#   # default_route_table_association = "disable"
#   # default_route_table_propagation = "disable"
# }

# module "tgw_attachment" {
#   source = "./modules/tgw_attachments"
#   vpc_attachments = [
#     {
#       # name used as for_each key
#       name                                            = "customer-vpc-${random_string.this.result}"
#       subnet_ids                                      = ["subnet-0320b3f11f99aea51"]
#       vpc_id                                          = "vpc-0c91a42b23ddaf449"
#       appliance_mode_support                          = "disable"
#       dns_support                                     = "enable"
#       ipv6_support                                    = "disable"
#       transit_gateway_id                              = module.tgw.transit_gateway.id
#       tags                                            = {}
#       transit_gateway_default_route_table_association = false
#       transit_gateway_default_route_table_propagation = false
#     },
#     {
#       name                                            = "security-vpc-${random_string.this.result}"
#       subnet_ids                                      = ["subnet-0173144909361d3c7"]
#       vpc_id                                          = "vpc-0c97b01f614c83e68"
#       appliance_mode_support                          = "disable"
#       dns_support                                     = "enable"
#       ipv6_support                                    = "disable"
#       transit_gateway_id                              = module.tgw.transit_gateway.id
#       tags                                            = {}
#       transit_gateway_default_route_table_association = false
#       transit_gateway_default_route_table_propagation = false
#     },
#   ]
# }

# # module "tgw_rtb" {
# #   source = "./modules/tgw_route_table"
# #   route_tables = [
# #     {
# #       # name used as for_each key
# #       name               = "customer-vpc-${local.id}"
# #       transit_gateway_id = module.tgw.transit_gateway.id
# #       tags               = {}
# #     },
# #     {
# #       name               = "security-vpc-${local.id}"
# #       transit_gateway_id = module.tgw.transit_gateway.id
# #       tags               = {}
# #     },
# #   ]
# # }

# # module "tgw_rtb_attachment_association" {
# #   source = "./modules/tgw_rtb_association"
# #   route_table_associations = [
# #     {
# #       rtb_name                       = "customer-vpc-${local.id}"
# #       transit_gateway_attachment_id  = module.tgw_attachment.vpc_attachment["customer-vpc-${local.id}"].id
# #       transit_gateway_route_table_id = module.tgw_rtb.route_table["customer-vpc-${local.id}"].id
# #       propagation_transit_gateway_attachment_ids = []
# #     },
# #     {
# #       rtb_name                       = "security-vpc-${local.id}"
# #       transit_gateway_attachment_id  = module.tgw_attachment.vpc_attachment["security-vpc-${local.id}"].id
# #       transit_gateway_route_table_id = module.tgw_rtb.route_table["security-vpc-${local.id}"].id
# #       propagation_transit_gateway_attachment_ids = [module.tgw_attachment.vpc_attachment["customer-vpc-${local.id}"].id,module.tgw_attachment.vpc_attachment["security-vpc-${local.id}"].id]
# #     },
# #   ]
# # }

# # module "tgw_static_routes" {
# #   source = "./modules/tgw_route"
# #   routes = [
# #     {
# #       name                           = "customer-to-security"
# #       blackhole                      = false
# #       default_route_table            = false
# #       destination_cidr_block         = "192.168.0.0/16"
# #       dst_tgw_attachment_id          = module.tgw_attachment.vpc_attachment["security-vpc-${local.id}"].id
# #       transit_gateway_route_table_id = module.tgw_rtb.route_table["customer-vpc-${local.id}"].id
# #     }
# #   ]
# # }