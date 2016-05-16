resource "aws_instance" "app-1" {
  ami = "" 
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.oscon-public-a.id}"
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
output "app-1-ip" {
    value = "${aws_instance.app-1.public_ip}"
}

resource "aws_instance" "app-2" {
  ami = "" 
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.oscon-public-b.id}"
  tags {
    Name = "oscon2016/app"
    Environment = "dev"
    Owner = "eng.security"
    Project = "oscon"
    Type = "app"
    Version = "0.2"
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
output "app-2-ip" {
    value = "${aws_instance.app-2.public_ip}"
}

