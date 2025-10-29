output "docker_host" {
  value = module.minikube.docker_host
}

output "docker_key" {
  sensitive = true
  value = module.minikube.docker_key
}

output "docker_certificate" {
  sensitive = true
  value = module.minikube.docker_certificate
}

output "docker_ca" {
  sensitive = true
  value = module.minikube.docker_ca
}



