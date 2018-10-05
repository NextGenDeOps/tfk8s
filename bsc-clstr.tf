resource "google_container_cluster" "primary" {
  name               = "my-gke-example"
  zone               = "us-east1"
  initial_node_count = 1
}
