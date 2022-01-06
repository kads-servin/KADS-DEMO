resource "google_pubsub_topic" "pubsub_topic_demo" {
  project = var.project_id
  name    = "pubsub-topic-demo"
}

resource "google_pubsub_subscription" "subscription_demo" {
  project = var.project_id
  name    = "suscription-demo"
  topic   = google_pubsub_topic.pubsub_topic_demo.name
}
