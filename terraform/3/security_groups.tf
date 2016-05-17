/* **********************************
   Allow SSH and HTTP from World (ELB)
   ******************************* */
resource "aws_security_group" "ssh-http-world" {
  name = "ssh-http-world"
  description = "Allow SSH and HTTP from world inbound; allow all outbound"
  vpc_id = "${aws_vpc.oscon.id}"
  
  # Allow SSH
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = 
        [
          "0.0.0.0/0",
        ]
  }

  # Allow HTTP
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = 
        [
          "0.0.0.0/0", 
        ]
  }

  # Allow all outbound
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
