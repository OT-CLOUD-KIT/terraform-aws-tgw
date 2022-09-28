variable "routes" {
  description = "List of TGW routes to add to TGW route tables"
  type = list(object({
    # `name` used as for_each key
    name                   = string
    blackhole              = bool
    default_route_table    = bool
    destination_cidr_block = string
    # name from `vpc_attachments` or id of a pre-existing tgw attachment
    dst_tgw_attachment_id  = string
    # name from `route_tables` or id of a pre-existing route table
    transit_gateway_route_table_id = string
  }))
  default = []
}