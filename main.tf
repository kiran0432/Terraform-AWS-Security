
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "kiran-test" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"

  tags = {
    Name = "Kiran"
  }
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = "kiran-0432-chow"  # Set a globally unique bucket name

  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }
}
resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"  # or any other ACL value you need
}
