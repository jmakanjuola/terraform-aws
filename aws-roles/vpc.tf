# Internet VPC
resource "aws_vpc" "demo-medal" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "demo-medal"
    }
}

# Subnets
resource "aws_subnet" "demo-medal-pub-1" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-2a"

    tags {
        Name = "demo-medal-pub-1"
    }

  }

resource "aws_subnet" "demo-medal-pub-2" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-2b"

    tags {
        Name = "demo-medal-pub-2"
    }
}

resource "aws_subnet" "demo-medal-pub-3" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-west-2c"

    tags {
        Name = "demo-medal-pub-3"
    }
}

resource "aws_subnet" "demo-medal-priv-1" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-2a"

    tags {
        Name = "demo-medal-priv-1"
    }
}

resource "aws_subnet" "demo-medal-priv-2" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-2b"

    tags {
        Name = "demo-medal-priv-2"
    }
}

resource "aws_subnet" "demo-medal-priv-3" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-west-2c"

    tags {
        Name = "demo-medal-priv-3"
    }
}

  # Internet GW
resource "aws_internet_gateway" "demo-medal-gw" {
    vpc_id = "${aws_vpc.demo-medal.id}"

    tags {
        Name = "demo-medal-gw"
    }
}

  # route tables
resource "aws_route_table" "demo-medal-pub" {
    vpc_id = "${aws_vpc.demo-medal.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.demo-medal-gw.id}"
    }

    tags {
        Name = "demo-medal-pub-1"
    }
}

  # route associations public
resource "aws_route_table_association" "demo-medal-pub-1-a" {
    subnet_id = "${aws_subnet.demo-medal-pub-1.id}"
    route_table_id = "${aws_route_table.demo-medal-pub.id}"
}
resource "aws_route_table_association" "demo-medal-pub-2-a" {
    subnet_id = "${aws_subnet.demo-medal-pub-2.id}"
    route_table_id = "${aws_route_table.demo-medal-pub.id}"
}
resource "aws_route_table_association" "demo-medal-pub-3-a" {
    subnet_id = "${aws_subnet.demo-medal-pub-3.id}"
    route_table_id = "${aws_route_table.demo-medal-pub.id}"
}
