resource "aws_security_group" "ollama_sg" {
  name        = "ollama-sg"
  description = "Allow SSH and necessary ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict to your IP in production
  }

  ingress {
    from_port   = 11434
    to_port     = 11434
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 7865
    to_port     = 7869
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ollama" {
  ami           = "ami-0e237771dba990721"
  instance_type = "g4dn.4xlarge"  # Adjust as needed
  key_name      = "ollama"
  security_groups = [aws_security_group.ollama_sg.name]

  root_block_device {
    volume_size = 200  # Increase root volume to 200GB
    volume_type = "gp3"  # Use gp3 for better performance and lower cost
    delete_on_termination = true
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "Setting up Ollama..."
              EOF

  tags = {
    Name = "Ollama-Instance"
  }
}

output "instance_ip" {
  value = aws_instance.ollama.public_ip
}
