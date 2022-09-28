variable "cross_account" {
  description = "Boolean whether this is a cross-account Transit Gateway shared via Resource Access Manager"
  type        = bool
  default     = false
}
variable "tags" {
  description = "Map of tags to apply to the TGW VPC attachment"
  type        = map(string)
  default     = {}
}

variable "vpc_attachments" {
  description = "List of VPC attachments to create with the transit gateway"
  # type = list(object({
  #   # `name` used as for_each key
  #   name                                            = string
  #   subnet_ids                                      = list(string)
  #   vpc_id                                          = string
  #   appliance_mode_support                          = string
  #   dns_support                                     = string
  #   ipv6_support                                    = string
  #   tags                                            = map(string)
  #   transit_gateway_default_route_table_association = bool
  #   transit_gateway_default_route_table_propagation = bool
  # }))
  #default = []
}