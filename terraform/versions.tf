provider "minikube" {
  kubernetes_version = "v1.30.2"
}

terraform {
  required_version = "= 1.5.7"
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "= 0.6.0"
    }
  }
}