# temporary vpc for oscon tutorial
resource "aws_vpc" "oscon" {
    cidr_block = "10.0.0.0/16"

    tags {
        Name = "oscon2016"
    }
}
resource "aws_internet_gateway" "oscon" {
    vpc_id = "${aws_vpc.oscon.id}"

    tags {
        Name = "oscon2016"
    }
}

# public subnet A
resource "aws_subnet" "oscon-public-a" {
    vpc_id = "${aws_vpc.oscon.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-west-2a"
    

    tags {
        Name = "oscon-public-a"
        Type = "public"
    }

}
resource "aws_route_table" "oscon-public-a" {
    vpc_id = "${aws_vpc.oscon.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.oscon.id}"
    }

    tags {
        Name = "oscon2016-public-a"
    }
}
resource "aws_route_table_association" "oscon-public-a" {
    subnet_id = "${aws_subnet.oscon-public-a.id}"
    route_table_id = "${aws_route_table.oscon-public-a.id}"
}


# public subnet B
resource "aws_subnet" "oscon-public-b" {
    vpc_id = "${aws_vpc.oscon.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-west-2b"

    tags {
        Name = "oscon-public-b"
        Type = "public"
    }
}
resource "aws_route_table" "oscon-public-b" {
    vpc_id = "${aws_vpc.oscon.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.oscon.id}"
    }

    tags {
        Name = "oscon2016-public-b"
    }
}
resource "aws_route_table_association" "oscon-public-b" {
    subnet_id = "${aws_subnet.oscon-public-b.id}"
    route_table_id = "${aws_route_table.oscon-public-b.id}"
}


# OUTPUTS
output "vpc_id" {
    value = "${aws_vpc.oscon.id}"
}

output "subnet_a_id" {
    value = "${aws_subnet.oscon-public-a.id}"
}

output "subnet_b_id" {
    value = "${aws_subnet.oscon-public-b.id}"
}
