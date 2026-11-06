terraform {   
   backend "s3" {
    bucket = "kjtech-terraform-state"
    key    = "terraform-day23.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}