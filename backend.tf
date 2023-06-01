terraform {
  backend "s3" {
    key    = "finops-aft"
    bucket = "anuj-tfbackend"
    region = "us-east-1"
  }
}
