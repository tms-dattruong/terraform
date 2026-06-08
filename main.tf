terraform {
  required_version = "1.15.5"

  cloud {
    organization = "TDT-1047"

    workspaces {
      name = "terraform"
    }
  }
}

provider "aws" {
}

resource "aws_instance" "vm_01" {
  ami           = "ami-0543dbdaf4e114be7"
  instance_type = "t3.micro"

  tags = {
    Name = "vm_01"
  }
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "ap-southeast-1a"
  size              = 10
  tags = {
    Name = "ebs_volume"
  }
}

resource "aws_volume_attachment" "ebs_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.vm_01.id
}