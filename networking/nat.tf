resource "aws_eip" "demo-adobe-sre-team-nat" {
  vpc	=true
}

resource "aws_nat_gateway" "demo-adobe-sre-team-nat-gw" {
  allocation_id = "${aws_eip.demo-adobe-sre-team-nat.id}"
  subnet_id = "${aws_subnet.demo-adobe-sre-team-pub-1.id}"
  depends_on = ["aws_internet_gateway.demo-adobe-sre-team-gw"]
}

# VPC setup for NAT
resource "aws_route_table" "demo-adobe-sre-team-priv" {
    vpc_id = "${aws_vpc.demo-adobe-sre-team.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.demo-adobe-sre-team-nat-gw.id}"
    }

    tags {
        Name = "demo-adobe-sre-team-priv-1"
    }
}
# route associations private
resource "aws_route_table_association" "demo-adobe-sre-team-priv-1-a" {
    subnet_id = "${aws_subnet.demo-adobe-sre-team-priv-1.id}"
    route_table_id = "${aws_route_table.demo-adobe-sre-team-priv.id}"
}
resource "aws_route_table_association" "demo-adobe-sre-team-priv-2-a" {
    subnet_id = "${aws_subnet.demo-adobe-sre-team-priv-2.id}"
    route_table_id = "${aws_route_table.demo-adobe-sre-team-priv.id}"
}
resource "aws_route_table_association" "demo-adobe-sre-team-priv-3-a" {
    subnet_id = "${aws_subnet.demo-adobe-sre-team-priv-3.id}"
    route_table_id = "${aws_route_table.demo-adobe-sre-team-priv.id}"
}
