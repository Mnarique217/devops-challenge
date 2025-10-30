provider "minikube" {
  kubernetes_version = "v1.30.2"
}

terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "~> 0.6.0"
    }
  }
}
