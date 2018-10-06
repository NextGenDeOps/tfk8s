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
