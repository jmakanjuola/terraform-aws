# Internet VPC
resource "aws_vpc" "demo-heartflow" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "demo-heartflow"
    }
}

# Subnets
resource "aws_subnet" "demo-heartflow-pub-1" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-2a"

    tags {
        Name = "demo-heartflow-pub-1"
    }
}
resource "aws_subnet" "demo-heartflow-pub-2" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-2b"

    tags {
        Name = "demo-heartflow-pub-2"
    }
}
resource "aws_subnet" "demo-heartflow-pub-3" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-2c"

    tags {
        Name = "demo-heartflow-pub-3"
    }
}
resource "aws_subnet" "demo-heartflow-priv-1" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-2a"

    tags {
        Name = "demo-heartflow-priv-1"
    }
}
resource "aws_subnet" "demo-heartflow-priv-2" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-2b"

    tags {
        Name = "demo-heartflow-priv-2"
    }
}
resource "aws_subnet" "demo-heartflow-priv-3" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-2c"

    tags {
        Name = "demo-heartflow-priv-3"
    }
}

# Internet GW
resource "aws_internet_gateway" "demo-heartflow-gw" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"

    tags {
        Name = "demo-heartflow-gw"
    }
}

# route tables
resource "aws_route_table" "demo-heartflow-pub" {
    vpc_id = "${aws_vpc.demo-heartflow.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.demo-heartflow-gw.id}"
    }

    tags {
        Name = "demo-heartflow-pub-1"
    }
}

# route associations public
resource "aws_route_table_association" "demo-heartflow-pub-1-a" {
    subnet_id = "${aws_subnet.demo-heartflow-pub-1.id}"
    route_table_id = "${aws_route_table.demo-heartflow-pub.id}"
}
resource "aws_route_table_association" "demo-heartflow-pub-2-a" {
    subnet_id = "${aws_subnet.demo-heartflow-pub-2.id}"
    route_table_id = "${aws_route_table.demo-heartflow-pub.id}"
}
resource "aws_route_table_association" "demo-heartflow-pub-3-a" {
    subnet_id = "${aws_subnet.demo-heartflow-pub-3.id}"
    route_table_id = "${aws_route_table.demo-heartflow-pub.id}"
}


