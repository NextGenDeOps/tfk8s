output "ip" {
    value = "${google_container_cluster.primary.endpoint}"
}

output "client_cert" {
    value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
    value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "ca_cert" {
    value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}