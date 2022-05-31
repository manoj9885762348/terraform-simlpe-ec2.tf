resource "aws_instance" "ansible_master" {
  ami             = "ami-0022f774911c1d690"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.TG_SSH-gg.name]
  key_name        = "AWS_key"


  provisioner "file"{
  source      =  "AWS_key.pem"
  destination = "/tmp/AWS_key.pem"
}
  provisioner "remote-exec" {
      inline = [
    "sudo yum update -y",
    "sudo yum -y install wget",
    "sudo yum -y install python3",
    "sudo amazon-linux-extras install ansible2 -y",
    "ansible --version",
    "sudo chmod 666 /tmp/AWS_key.pem"
   ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("AWS_key.pem")
  }
  tags = {
    "Name" = "ansible_Master"
  }

}