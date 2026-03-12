# Docker Commands Cheatsheet 🐳

## 1. Docker Version & Info

* `docker --version` – Show Docker version
* `docker version` – Show detailed version info
* `docker info` – Display system-wide info

## 2. Working with Images

* `docker pull <image>` – Download image from Docker Hub
* `docker build -t <name> .` – Build image from Dockerfile
* `docker images` – List local images
* `docker rmi <image>` – Remove an image
* `docker tag <image> <tag>` – Tag an image

## 3. Running Containers

* `docker run <image>` – Run a container
* `docker run -it <image> bash` – Run interactively with shell
* `docker run -d <image>` – Run container in detached mode
* `docker ps` – List running containers
* `docker ps -a` – List all containers
* `docker stop <container>` – Stop container
* `docker start <container>` – Start stopped container
* `docker restart <container>` – Restart container
* `docker rm <container>` – Remove container

## 4. Container Logs & Monitoring

* `docker logs <container>` – View logs of a container
* `docker logs -f <container>` – Follow logs in real-time
* `docker stats` – Live container resource usage
* `docker exec -it <container> bash` – Enter running container

## 5. Networking

* `docker network ls` – List networks
* `docker network create <name>` – Create a network
* `docker network rm <name>` – Remove network
* `docker run --network <name> <image>` – Connect container to network

## 6. Volumes

* `docker volume ls` – List volumes
* `docker volume create <name>` – Create volume
* `docker volume rm <name>` – Remove volume
* `docker run -v <volume>:/path <image>` – Mount volume

## 7. Docker Compose

* `docker-compose up` – Start services defined in docker-compose.yml
* `docker-compose up -d` – Detached mode
* `docker-compose down` – Stop and remove containers, networks
* `docker-compose logs` – View logs of all services
* `docker-compose build` – Build images defined in compose file

## 8. Cleanup

* `docker system prune` – Remove unused data (images, containers, volumes)
* `docker container prune` – Remove stopped containers
* `docker image prune` – Remove unused images
* `docker volume prune` – Remove unused volumes

---

### ⚡ Pro Tips

* Use `docker run --rm` to automatically remove a container after it stops
* Combine `docker ps -a` + `docker rm $(docker ps -aq)` to remove all containers quickly
* Use `docker logs -f` to follow logs in real-time

