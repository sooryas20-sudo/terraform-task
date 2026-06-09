provider "aws" {
  alias  = "sydney"
  region = "ap-southeast-2"
}

provider "aws" {
  alias  = "singapore"
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2_sydney" {
  provider      = aws.sydney
  ami           = "ami-0892a9c01908fafd1"
  instance_type = "t2.micro"
  tags = {
    Name    = "terraform-sydney"
    Region  = "ap-southeast-2"
    Project = "terraform-task"
  }
}

resource "aws_instance" "ec2_singapore" {
  provider      = aws.singapore
  ami           = "ami-0df7a207adb9748c7"
  instance_type = "t2.micro"
  tags = {
    Name    = "terraform-singapore"
    Region  = "ap-southeast-1"
    Project = "terraform-task"
  }
}

output "sydney_instance_id" {
  value = aws_instance.ec2_sydney.id
}

output "sydney_public_ip" {
  value = aws_instance.ec2_sydney.public_ip
}

output "singapore_instance_id" {
  value = aws_instance.ec2_singapore.id
}

output "singapore_public_ip" {
  value = aws_instance.ec2_singapore.public_ip
}
