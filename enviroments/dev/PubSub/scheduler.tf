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
    data       = base64encode("TEST DEMO KADS, Hello Mentees have a good day! (โโกโ)")
  }

  # depends_on = [google_project_service.project,google_app_engine_application.app]
}