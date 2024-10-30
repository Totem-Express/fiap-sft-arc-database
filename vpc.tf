resource "aws_vpc" "totem_express_db_vpc" {
  cidr_block = var.vpc_cidr  # Use the variable for the CIDR block
}

resource "aws_subnet" "totem_express_db_subnet" {
  count                 = 2  # Create multiple subnets for high availability
  vpc_id                = aws_vpc.totem_express_db_vpc.id
  cidr_block            = cidrsubnet(aws_vpc.totem_express_db_vpc.cidr_block, 2, count.index)
  availability_zone     = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Application =  "totem-express"
    Name = "totem-express-subnet-${count.index}"
  }
}
