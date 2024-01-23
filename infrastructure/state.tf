terraform {
  backend "s3" {
    bucket = "b2c-tfstate"
    key    = "rhoton/spot_fleet_poc.tfstate"
    region = "us-west-2"
  }
}
