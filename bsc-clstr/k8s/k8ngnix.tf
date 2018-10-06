module "bsc-clstr" {
  source = "../"
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