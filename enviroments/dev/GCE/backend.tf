terraform {
  backend "gcs" {
    bucket = "kads_demo_bucket-1"
    prefix = "terraform/gce"
  }
}