variable "amazon_side_asn" {
  description = "Private Autonomous System Number (ASN) for the Amazon side of a BGP session (range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASN)"
  type        = number
  default     = 64512
}

variable "auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted (valid values: disable, enable)"
  type        = string
  default     = "disable"
  validation {
    condition     = contains(["enable", "disable"], var.auto_accept_shared_attachments)
    error_message = "`auto_accept_shared_attachments` must be one of: \"enable\", \"disable\"."
  }
}

variable "default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table (valid values: disable, enable)"
  type        = string
  default     = "enable"
  validation {
    condition     = contains(["enable", "disable"], var.default_route_table_association)
    error_message = "`default_route_table_association` must be one of: \"enable\", \"disable\"."
  }
}

variable "default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table (valid values: disable, enable)"
  type        = string
  default     = "enable"
  validation {
    condition     = contains(["enable", "disable"], var.default_route_table_propagation)
    error_message = "`default_route_table_propagation` must be one of: \"enable\", \"disable\"."
  }
}

variable "description" {
  description = "Description of the EC2 Transit Gateway"
  type        = string
  default     = null
}

variable "dns_support" {
  description = "Whether DNS support is enabled (valid values: disable, enable)"
  type        = string
  default     = "enable"
  validation {
    condition     = contains(["enable", "disable"], var.dns_support)
    error_message = "`dns_support` must be one of: \"enable\", \"disable\"."
  }
}

variable "tags" {
  description = "Map of tags to apply to the TGW and associated resources"
  type        = map(string)
  default     = {}
}

variable "vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath Protocol support is enabled (valid values: disable, enable)"
  type        = string
  default     = "disable"
  validation {
    condition     = contains(["enable", "disable"], var.vpn_ecmp_support)
    error_message = "`vpn_ecmp_support` must be one of: \"enable\", \"disable\"."
  }
}
variable "transit_gateway_cidr_blocks" {
  default = []
}