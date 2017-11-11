resource "aws_eip" "demo-medal-nat" {
  vpc	=true
}

resource "aws_nat_gateway" "demo-medal-nat-gw" {
  allocation_id = "${aws_eip.demo-medal-nat.id}"
  subnet_id = "${aws_subnet.demo-medal-pub-1.id}"
  depends_on = ["aws_internet_gateway.demo-medal-gw"]
}

# VPC setup for NAT
resource "aws_route_table" "demo-medal-priv" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.demo-medal-nat-gw.id}"
    }

    tags {
        Name = "demo-medal-priv-1"
    }
}
# route associations private
resource "aws_route_table_association" "demo-medal-priv-1-a" {
    subnet_id = "${aws_subnet.demo-medal-priv-1.id}"
    route_table_id = "${aws_route_table.demo-medal-priv.id}"
}
resource "aws_route_table_association" "demo-medal-priv-2-a" {
    subnet_id = "${aws_subnet.demo-medal-priv-2.id}"
    route_table_id = "${aws_route_table.demo-medal-priv.id}"
}
resource "aws_route_table_association" "demo-medal-priv-3-a" {
    subnet_id = "${aws_subnet.demo-medal-priv-3.id}"
    route_table_id = "${aws_route_table.demo-medal-priv.id}"
}
