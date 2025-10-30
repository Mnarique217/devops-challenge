# https://registry.terraform.io/providers/scott-the-programmer/minikube/latest/docs/resources/cluster#insecure_registry-1
resource "minikube_cluster" "docker" {
  driver            = var.driver
  cluster_name      = var.cluster_name
  addons            = var.addons
  insecure_registry = var.insecure_registry
  network           = var.network
}
