# Docker Command Reference Guide

<br>

## 1. Docker Hub & Registry Operations

### Authentication

```bash
# Login to Docker Hub
docker login -u <username>

# Logout from Docker registry
docker logout
```

### Image Push / Pull

```bash
# Push image to Docker Hub
docker push <username>/<image_name>:<tag>

# Pull image from Docker Hub
docker pull <image_name>:<tag>
```

### Search Images

```bash
# Search Docker Hub for images
docker search <image_name>
```

---

## 2. Docker Images Management

### Build Images

```bash
# Build image from Dockerfile
docker build -t <image_name>:<tag> .

# Build image without using cache
docker build --no-cache -t <image_name>:<tag> .
```

### List & Inspect Images

```bash
# List all local images
docker images

# Inspect image metadata
docker inspect <image_name>
```

### Remove Images

```bash
# Remove a specific image
docker rmi <image_name>

# Remove unused (dangling) images
docker image prune

# Remove all unused images (force)
docker image prune -a
```

### View the history of a Docker image
```bash
docker history <image_name_or_id>
```

---

## 3. Docker Container Lifecycle

### Run Containers

```bash
# Create and run a container
docker run <image_name>

# Run container with custom name
docker run --name <container_name> <image_name>

# Run container in detached mode
docker run -d <image_name>

# Run container with port mapping
docker run -p <host_port>:<container_port> <image_name>

# Run container with environment variables
docker run -e KEY=value <image_name>

# Run container with volume mount
docker run -v /host/path:/container/path <image_name>

# Attach a container to an existing network
docker network connect <network_name> <container_name_or_id>

# Disconnect a container from a network
docker network disconnect <network_name> <container_name_or_id>

# Rename a Docker container
docker rename <old_name> <new_name>

```

---

### Start / Stop Containers

```bash
# Start a stopped container
docker start <container_name>

# Stop a running container
docker stop <container_name>

# Restart a container
docker restart <container_name>

# Restart all stopped containers
docker start $(docker ps -q -a)
```

---

### Remove Containers

```bash
# Remove a stopped container
docker rm <container_name>

# Force remove a running container
docker rm -f <container_name>

# Remove all stopped containers
docker container prune
```
---

### Set environment variables in a Docker container

Use the -e option:
```bash
docker run -e MY_VAR=value <image_name>
```
**Or use the ENV instruction in a Dockerfile:**

ENV MY_VAR value

### Export and Import a Docker container
```bash
# To export a container
docker export <container_name_or_id> > my_container.tar

# To import it
cat my_container.tar | docker import - my_image:latest
```

---

## 4. Container Interaction & Debugging

### Access Containers

```bash
# Open shell inside running container (sh)
docker exec -it <container_name> sh

# Open bash shell (if available)
docker exec -it <container_name> bash
```

### Logs & Monitoring

```bash
# View container logs
docker logs <container_name>

# Follow logs in real time
docker logs -f <container_name>

# Show resource usage (CPU, memory, IO)
docker stats
docker container stats
```

### Inspect Containers

```bash
# Inspect container details
docker inspect <container_name>

# View container processes
docker top <container_name>
```

---

## 5. Container Listing & Status

```bash
# List running containers
docker ps

# List all containers (running + stopped)
docker ps -a
```

---

## 6. Networking Commands

```bash
# List Docker networks
docker network ls

# Inspect a network
docker network inspect <network_name>

# Create a custom bridge network
docker network create <network_name>

# To attach a container
docker run --network my_bridge <image_name>

# Remove a network
docker network rm <network_name>
```

---

## 7. Volume Management

```bash
# List volumes
docker volume ls

# Create volume
docker volume create <volume_name>

# Attach volume to image
docker run -v my_volume:/data <image_name>

# Inspect volume
docker volume inspect <volume_name>

# Remove volume
docker volume rm <volume_name>

# Remove all unused volumes
docker volume prune
```

---

## 8. System Cleanup & Info

```bash
# Show Docker system information
docker info

# Show Docker disk usage
docker system df

# Remove unused containers, images, networks
docker system prune

# Aggressive cleanup (includes images)
docker system prune -a
```

---

## 9. Docker Compose (Commonly Used)

```bash
# Start services
docker compose up

# Start services in detached mode
docker compose up -d

# Stop services
docker compose down

# View running services
docker compose ps

# View logs
docker compose logs -f

# Rebuild images
docker compose build
```

```bash
# Scale Services
docker-compose up --scale <service_name>=<number>
Example: docker-compose up --scale web=3
```

---

## 10. Best Practices (Documentation Notes)

* Always tag images (`:v1`, `:latest`)
* Use `.dockerignore` to reduce build context
* Avoid running containers as root
* Clean unused images regularly
* Use volumes for persistent data
* Prefer Docker Compose for multi-container apps



---

## 11. Limit a container's CPU and Memory usage

```bash
# To limit CPU usage
docker run --cpus="1.5" <image_name>

# To limit memory usage
docker run -m="512m" <image_name>
```

## 12. Copy files from a container to the host?

```bash
# copy container to host
docker cp <container_id>:<container_path> <host_path>
```

## 13. What are Docker tags, and how do you create them?
Docker tags are labels applied to images to identify different versions. 
```bash
# docker tag
docker tag <image_id> <repository>:<tag>
```