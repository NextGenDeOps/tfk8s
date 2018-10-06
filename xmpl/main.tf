variable "credentials_path" {
    default =   "../../crdntls/my-terraform-gke-svc.json"
}

variable "project_name" {
  default = "my-terraform-gke"
}

variable "region" {
  default = "us-east1"
}

variable "cluster_name" {
    default = "my-gke-example"
}

variable "cluster_zone" {
  default = "us-east1-b"
}

variable "master_auth_username" {
  default = "admin"
}

variable "master_auth_password" {
  default = "not.admin.must.be.16.chars.or.long"
}

variable "kubernetes_secret_pwd" {
  default = "not.secret"
}

module "container_cluster" {
    source               = "./gce-container-cluster"
    credentials_path     = "${var.credentials_path}"
    project_name         = "${var.project_name}"
    region               = "${var.region}"
    cluster_name         = "${var.cluster_name}"
    cluster_zone         = "${var.cluster_zone}"
    master_auth_username = "${var.master_auth_username}"
    master_auth_password = "${var.master_auth_password}"
}

module "kubernetes_secret" {
    source                 = "./kubernetes-secret"
    endpoint_ip            = "${module.container_cluster.ip}"
    username               = "${var.master_auth_username}"
    password               = "${var.master_auth_password}"
    client_cert            = "${base64decode(module.container_cluster.client_cert)}"
    client_key             = "${base64decode(module.container_cluster.client_key)}"
    cluster_ca_certificate = "${base64decode(module.container_cluster.ca_cert)}"
    kubernetes_secret_pwd  = "${var.kubernetes_secret_pwd}"
}
