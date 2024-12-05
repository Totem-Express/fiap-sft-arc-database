provider "aws" {
  region = var.aws_region
}

terraform { 
  cloud { 
    organization = "postech-fiap-alura" 
    workspaces { 
      name = "totem-express" 
    } 
  } 
}

data "aws_availability_zones" "available" {}
