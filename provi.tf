terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
 
}


resource "aws_instance" "myec2" {
   ami = "ami-030f8f64679a7bef6"
   instance_type = "t2.micro"
   key_name = "fkdelete"
   
   
   connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file("/home/fusionaws/k8/fkdelete.pem")
     host = self.public_ip
     }
     
  provisioner "remote-exec" {
    inline = [
       "sudo apt install nginx -y ",
       "sudo systemctl start nginx"
       ]
       }
  }        
     

