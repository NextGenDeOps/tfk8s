provider "google" {
  credentials = "${file("../crdntls/my-terraform-gke-svc.json")}"
  project     = "my-terraform-gke"
  region      = "us-east1"
}
