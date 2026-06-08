terraform {
  required_version = "1.15.5"

  cloud {
    
    organization = "TDT-1047"

    workspaces {
      name = "dev"
    }
  }
}

provider "aws" {
}

resource "aws_instance" "vm_01" {
  ami = "ami-0543dbdaf4e114be7"
  instance_type = "t3.micro"

  tags = {
    Name = "vm_01"
  }
}