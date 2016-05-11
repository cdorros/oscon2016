resource "aws_instance" "app-1" {
  ami = "" 
  instance_type = "t2.micro"
  subnet_id = "${lookup(var.subnets, var.avail_zone_primary)}"
  tags {
    Name = "oscon2016/app"
    Environment = "dev"
    Owner = "eng.security"
    Project = "oscon"
    Type = "app"
    Version = "0.1"
  }
  key_name = "${var.key_name}"
  vpc_security_group_ids = [
      "${aws_security_group.ssh-http-world.id}",
  ]
  associate_public_ip_address = true
  root_block_device {
    volume_type = "gp2"
    volume_size = "20"
    delete_on_termination = true
  }
}

