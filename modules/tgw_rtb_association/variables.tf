variable "route_table_associations" {
  description = "List of TGW route tables to create with the transit gateway"
  type = list(object({
    # `name` used as for_each key
    rtb_name                       = string
    #propagation_enable             = bool
    transit_gateway_attachment_id  = string
    transit_gateway_route_table_id = string
    propagation_transit_gateway_attachment_ids = list(string)
  }))
  default = []
}