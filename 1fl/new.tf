provider "google" {
  credentials = "${file("../../crdntls/my-terraform-gke-svc.json")}"
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

# The following outputs allow authentication and connectivity to the GKE Cluster.

output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

output "cluster_name" {
  value = "${google_container_cluster.primary.name}"
}

output "primary_zone" {
  value = "${google_container_cluster.primary.zone}"
}

output "additional_zones" {
  value = "${google_container_cluster.primary.additional_zones}"
}

output "endpoint" {
  value = "${google_container_cluster.primary.endpoint}"
}

output "node_version" {
  value = "${google_container_cluster.primary.node_version}"
}

output "username" {
  value = "${google_container_cluster.primary.master_auth.0.username}"
}

output "password" {
  value = "${google_container_cluster.primary.master_auth.0.password}"
}

provider "kubernetes" {
    host = "https://${module.bsc-clstr.endpoint}"
    username = "${module.bsc-clstr.username}"
    password = "${module.bsc-clstr.password}"
}

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "my-nginx-example"
    labels {
      App = "nginx"
    }
  }

  spec {
    container {
      image = "nginx:1.7.8"
      name  = "my-example"

      port {
        container_port = 80
      }
    }
  }
}