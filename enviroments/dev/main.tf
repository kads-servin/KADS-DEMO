
module "create_gce" {
  source       = "./GCE"
  project_id   = var.project_id
#   depends_on   = [module.create_vpc]
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