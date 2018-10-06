
variable "endpoint_ip" {
}

variable "username" {
}

variable "password" {
}

variable "client_cert" {
}

variable "client_key" {
}

variable "cluster_ca_certificate" {
}

variable "kubernetes_secret_pwd" {
}

provider "kubernetes" {
    host                   = "https://${var.endpoint_ip}"
    username               = "${var.username}"
    password               = "${var.password}"
    # client_certificate     = "${var.client_cert}"
    # client_key             = "${var.client_key}"
    # cluster_ca_certificate = "${var.cluster_ca_certificate}"
}

resource "kubernetes_secret" "mysql_pwd" {

    metadata {
        name = "mysql"
    }

    data {
        password = "${var.kubernetes_secret_pwd}"
    }
}