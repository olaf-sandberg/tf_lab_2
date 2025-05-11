terraform {
  backend "s3" {
    key            = "tf/terraform.tfstate"
    region         = "eu-central-1"
    bucket         = "tf-state-olo"
    dynamodb_table = "tf-lab2"
    encrypt        = true
  }
}
