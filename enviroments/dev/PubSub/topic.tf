resource "google_pubsub_topic" "pubsub-topic-demo" {
  name = "pubsub-topic-demo"
}

resource "google_pubsub_subscription" "subscription-demo" {
  name  = "suscription-demo"
  topic = google_pubsub_topic.pubsub-topic-demo

  ack_deadline_seconds = 20

  labels = {
    foo = "bar"
  }

  push_config {
    push_endpoint = "https://example.com/push"

    attributes = {
      x-goog-version = "v1"
    }
  }
}