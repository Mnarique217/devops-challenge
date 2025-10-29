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

module "minikube" {
  source = "./modules/kubernetes"
  driver            = var.driver
  cluster_name      = var.cluster_name
  addons            = var.addons
  insecure_registry = var.insecure_registry 
}