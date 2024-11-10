terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "2.3.0"
    }
  }
}

provider "vercel" {
  # Configuration options
  api_token = "jPbfOSyzmgBnaBqOwsQbTMh9"
  team      = "team_GLNQNbd7yd2FqeuaivTbVzeT"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-state-vercel-project-prod"
    key     = "terraform-state-vercel-project-prod/security/terraform.tfstate"
    region  = "ap-south-1"
  }
}

provider "aws" {
}