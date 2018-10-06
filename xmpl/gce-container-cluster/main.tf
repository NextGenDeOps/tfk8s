variable "credentials_path" {
}

variable "project_name" {
}

variable "region" {
}

variable "cluster_name" {
}

variable "cluster_zone" {
}

variable "master_auth_username" {
}

variable "master_auth_password" {
}


provider "google" {
    credentials = "${file(var.credentials_path)}"
    project     = "${var.project_name}"
    region      = "${var.region}"
}

variable "disk_name" {
    default = [
        "mysql-disk",
        "wordpress-disk"
    ]
}

resource "google_compute_disk" "disk" {
    count = 2
    name  = "${var.disk_name[count.index]}"
    zone  = "${var.cluster_zone}"
}

resource "google_container_cluster" "primary" {
    name               = "${var.cluster_name}"
    zone               = "${var.cluster_zone}"
    initial_node_count = 3

    master_auth {
        username = "${var.master_auth_username}"
        password = "${var.master_auth_password}"
    }
}
