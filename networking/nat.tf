resource "aws_eip" "demo-abra-nat" {
  vpc	=true
}

resource "aws_nat_gateway" "demo-abra-nat-gw" {
  allocation_id = "${aws_eip.demo-abra-nat.id}"
  subnet_id = "${aws_subnet.demo-abra-pub-1.id}"
  depends_on = ["aws_internet_gateway.demo-abra-gw"]
}

# VPC setup for NAT
resource "aws_route_table" "demo-abra-priv" {
    vpc_id = "${aws_vpc.demo-abra.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.demo-abra-nat-gw.id}"
    }

    tags {
        Name = "demo-abra-priv-1"
    }
}
# route associations private
resource "aws_route_table_association" "demo-abra-priv-1-a" {
    subnet_id = "${aws_subnet.demo-abra-priv-1.id}"
    route_table_id = "${aws_route_table.demo-abra-priv.id}"
}
resource "aws_route_table_association" "demo-abra-priv-2-a" {
    subnet_id = "${aws_subnet.demo-abra-priv-2.id}"
    route_table_id = "${aws_route_table.demo-abra-priv.id}"
}
resource "aws_route_table_association" "demo-abra-priv-3-a" {
    subnet_id = "${aws_subnet.demo-abra-priv-3.id}"
    route_table_id = "${aws_route_table.demo-abra-priv.id}"
}


