resource "aws_elb" "app-elb" {

  name = "oscon2016-app-elb"
  depends_on = ["aws_internet_gateway.oscon"]  

  # allow existing connections to unhealthy hosts to persist for 5 seconds
  # before re-routing to new back-end 
  #connection_draining = true
  #connection_draining_timeout = 5

  # load balance across all backend avail zones
  cross_zone_load_balancing = true

  security_groups = [
      "${aws_security_group.ssh-http-world.id}",
  ]

  subnets = [
    "${aws_subnet.oscon-public-a.id}",
    "${aws_subnet.oscon-public-b.id}",
  ]

  listener {
    # port to route to in backend
    instance_port = 80
    instance_protocol = "http"

    # port ELB listens on
    lb_port = 80
    lb_protocol = "http"
  }

  # app instances in rotation on ELB
  instances = [
    "${aws_instance.app-1.id}"
  ]


  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 5
  }

  tags {
    Name = "oscon2016-app-elb"
    Environment = "dev"
    Owner = "eng.security"
    Project = "oscon"
    Type = "elb"
  }
}
output "elb-fqdn" {
    value = "${aws_elb.app-elb.dns_name}"
}

