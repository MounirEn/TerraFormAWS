resource "aws_instance" "app_server" {
  ami           = "ami-02ea01341a2884771"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id     = aws_subnet.my_subnet.id
 
  tags = {
    Name = "terratp"
  }
}
resource "aws_vpc" "main" {
  
  cidr_block = "10.0.0.0/16" 
}  
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id
 
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }
 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "allow_tls"
  }
  
}  
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.main.id     # Association avec la VPC principale
  cidr_block              = aws_vpc.main.cidr_block  # Bloc CIDR pour le sous-réseau
  availability_zone       = "eu-west-3a"        # Zone de disponibilité pour le sous-réseau
}

