resource "aws_eip" "demo-heartflow-nat" {
  vpc	=true
}

resource "aws_nat_gateway" "demo-heartflow-nat-gw" {
  allocation_id = "${aws_eip.demo-heartflow-nat.id}"
  subnet_id = "${aws_subnet.demo-heartflow-pub-1.id}"
  depends_on = ["aws_internet_gateway.demo-heartflow-gw"]
}

# VPC setup for NAT
resource "aws_route_table" "demo-heartflow-priv" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.demo-heartflow-nat-gw.id}"
    }

    tags {
        Name = "demo-heartflow-priv-1"
    }
}
# route associations private
resource "aws_route_table_association" "demo-heartflow-priv-1-a" {
    subnet_id = "${aws_subnet.demo-heartflow-priv-1.id}"
    route_table_id = "${aws_route_table.demo-heartflow-priv.id}"
}
resource "aws_route_table_association" "demo-heartflow-priv-2-a" {
    subnet_id = "${aws_subnet.demo-heartflow-priv-2.id}"
    route_table_id = "${aws_route_table.demo-heartflow-priv.id}"
}
resource "aws_route_table_association" "demo-heartflow-priv-3-a" {
    subnet_id = "${aws_subnet.demo-heartflow-priv-3.id}"
    route_table_id = "${aws_route_table.demo-heartflow-priv.id}"
}


