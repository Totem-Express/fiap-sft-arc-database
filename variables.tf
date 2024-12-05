variable "aws_region" {
  description = "AWS region"
  type        = string
  default = "us-west-1"
}

variable "db_version" {
  description = "Database version"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage size in GB"
  type        = number
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
