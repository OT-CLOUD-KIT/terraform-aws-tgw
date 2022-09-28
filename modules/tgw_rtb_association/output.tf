output "route_table_association" {
  description = "Object with the Transit Gateway route table association attributes"
  value       = aws_ec2_transit_gateway_route_table_association.this
}

output "route_table_propagations" {
  description = "Map of Transit Gateway route table propagation objects"
  value       = aws_ec2_transit_gateway_route_table_propagation.this
}