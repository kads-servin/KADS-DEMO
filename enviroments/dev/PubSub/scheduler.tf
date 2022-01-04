resource "google_pubsub_topic" "topic" {
  name = "pubsub-topic-demo"
}

resource "google_cloud_scheduler_job" "job-scheduler" {
  name        = "job-scheduler"
  description = "Job scheduler for demo"
  schedule    = "*/5 * * * *"

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("test")
  }
}