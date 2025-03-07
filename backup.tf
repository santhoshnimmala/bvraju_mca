terraform {
  backend "s3" {
    bucket         = "samples3state944"  # Replace with your S3 bucket name
    key            = "ollama/terraform.tfstate"     # Path to store the state file
    region         = "us-east-1"                    # Replace with your AWS region
    encrypt        = true                           # Encrypt the state file
  }
}