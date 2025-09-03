output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.main.id
}

output "subnet_ids2" {
  value = aws_subnet.main2.id
}

output "subnet_ids3" {
  value = aws_subnet.main3.id
}

output "route_table_id" {
  value = aws_route_table.example.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id 
}