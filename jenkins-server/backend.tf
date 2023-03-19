terraform {
  backend "s3" {
    bucket = "jenbucket00000000"
    region = "us-east-1"
    key = "jenkins_key/terraform.tfstate"
  }
}
