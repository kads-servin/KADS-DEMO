module "create_vpc" {
  source      = "git::https://github.com/kads-servin/GCP-RD.git//modules/Network/"
  project_id  = var.project_id
  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"
}

module "create_gce" {
  source       = "git::https://github.com/kads-servin/GCP-RD.git//modules/GCE/"
  project_id   = var.project_id
  name         = "gce-kads-demo"
  machine_type = "n2d-standard-2"
  vpc_name     = module.create_vpc.vpc_selflink
  subnet_name  = module.create_vpc.subnet_selflink
  depends_on   = [module.create_vpc]
}

resource "google_pubsub_topic" "pubsub_topic_demo" {
  project = var.project_id
  name    = "pubsub-topic-demo"
}

resource "google_pubsub_subscription" "subscription_demo" {
  project = var.project_id
  name    = "suscription-demo"
  topic   = google_pubsub_topic.pubsub_topic_demo.name
}

resource "google_cloud_scheduler_job" "job_scheduler" {
  project     = var.project_id
  name        = "job-scheduler"
  description = "Job scheduler for demo"
  time_zone   = "America/Mexico_City"
  region      = "us-central1"
  schedule    = "*/1 * * * *"

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.pubsub_topic_demo.id
    data       = base64encode("TEST DEMO KADS, Hello Mentees have a good day! (◔◡◔)")
  }

  # depends_on = [google_project_service.project,google_app_engine_application.app]
}