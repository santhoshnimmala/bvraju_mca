data "aws_ami" "ollama" {
  owners      = ["224313470822"]

  filter {
    name   = "name"
    values = ["ollama_image"]
  }
}
