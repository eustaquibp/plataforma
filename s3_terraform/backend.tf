terraform {
  backend "s3" {
    bucket     = "terraform-alelo"
    region     = "us-east-1"
  }
}
