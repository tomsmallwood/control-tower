terraform {
  backend "s3" {
    bucket = "anuj-tfbackend"
    region = "us-east-1"
  }
}
