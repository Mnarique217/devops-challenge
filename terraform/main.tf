# https://developer.hashicorp.com/terraform/language/backend/s3
terraform {
  backend "s3" {
    bucket = "terraform-tfstate"
    key    = "kubernetes/minikube"
    region = "us-east-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

# https://registry.terraform.io/providers/scott-the-programmer/minikube/latest/docs/resources/cluster#insecure_registry-1
resource "minikube_cluster" "docker" {
  driver            = var.driver
  cluster_name      = var.cluster_name
  addons            = var.addons
  insecure_registry = var.insecure_registry
}
