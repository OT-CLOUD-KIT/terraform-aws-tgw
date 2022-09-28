variable "route_tables" {
  description = "List of TGW route tables to create with the transit gateway"
  type = list(object({
    # `name` used as for_each key
    name               = string
    transit_gateway_id = string
    tags               = map(string)
  }))
  default = []
}

variable "tags" {
  description = "Map of tags to apply to the TGW route table"
  type        = map(string)
  default     = {}
}