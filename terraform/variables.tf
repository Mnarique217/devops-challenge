
variable "driver" {
    type = string
    default = "docker"
}

variable "cluster_name" {
    type = string
    default = "terraform-provider-minikube-acc-docker"
}

variable "addons" {
    type = list(string)
    default = [
        "default-storageclass",
        "storage-provisioner",
        "ingress"
    ]
}

variable "insecure_registry" {
    type = list(string)
    default = ["192.168.49.1:5000"]
}

variable "network" {
  default = "bridge"
}