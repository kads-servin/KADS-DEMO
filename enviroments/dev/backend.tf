terraform {
  backend "gcs" {
    bucket = "kads-demo-bucket-02"
    prefix = "terraform/gce"
  }
}