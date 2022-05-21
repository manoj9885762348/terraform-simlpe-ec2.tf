resource "aws_instance" "terraform_instance" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
   security_groups = [aws_security_group.TF_SG.name]
   key_name = "AWS_key"

  tags = {
    Name = "jenkins"
  }
 connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("AWS_key.pem")
    host     = self.public_ip

  }

   provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum -y install wget",
      "sudo amazon-linux-extras install java-openjdk11 -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install jenkins -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "sudo systemctl status jenkins",
    ]
   }
}

