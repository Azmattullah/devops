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

---

## 10. Best Practices (Documentation Notes)

* Always tag images (`:v1`, `:latest`)
* Use `.dockerignore` to reduce build context
* Avoid running containers as root
* Clean unused images regularly
* Use volumes for persistent data
* Prefer Docker Compose for multi-container apps
