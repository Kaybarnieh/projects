resource "aws_instance" "web-server" {
  ami                         = "ami-0d729d2846a86a9e7"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.webserver-security-group.id}"]
  subnet_id                   = aws_subnet.web-subnet-1.id
  count                       = 1
  associate_public_ip_address = true
  tags = {
    Name        = "web server"
  }
}

resource "aws_instance" "web-server-2" {
  ami                         = "ami-0d729d2846a86a9e7"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.webserver-security-group.id}"]
  subnet_id                   = aws_subnet.web-subnet-2.id
  count                       = 1
  associate_public_ip_address = true
  tags = {
    Name        = "web server2"
  }
}