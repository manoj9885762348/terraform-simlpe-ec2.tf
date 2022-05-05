resource "aws_instance" "training" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
}
