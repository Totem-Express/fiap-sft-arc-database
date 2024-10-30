resource "aws_security_group" "db_sg" {
  name        = "${var.db_name}-sg"
  description = "Allow access to RDS instance"
  vpc_id      = aws_vpc.totem_express_db_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.totem_express_db_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.db_name}-sg"
  }
}
