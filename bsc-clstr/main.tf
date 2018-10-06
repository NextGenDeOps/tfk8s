provider "google" {
  credentials = "${file("../../../crdntls/my-terraform-gke-svc.json")}"
  project     = "my-terraform-gke"
  region      = "us-east1"
}

resource "google_container_cluster" "primary" {
  name               = "my-gke-example"
  zone               = "us-east1-a"
  initial_node_count = 1
  additional_zones   = [
    "us-east1-b",
    "us-east1-d"
  ]
   master_auth {
    username = "mr.yoda"
    password = "adoy.rm"
  }
}

