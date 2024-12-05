resource "aws_db_subnet_group" "default" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = aws_subnet.totem_express_db_subnet.*.id

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = var.db_allocated_storage
  instance_class   = var.db_instance_class
  engine             = "mysql"
  engine_version      = var.db_version  # Specify desired MySQL version
  # name                = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = var.db_name
  }
}
