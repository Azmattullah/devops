# Docker Vs Docker Compose


## Docker

**What it is:**
Docker is the core platform for **building, running, and managing containers**.

**What you do with it:**

* Build images (`docker build`)
* Run containers (`docker run`)
* Manage images, containers, networks, volumes

**Example (single container):**

```bash
docker run -d -p 3000:3000 node:18
```

**Best for:**

* One container at a time
* Simple apps or services
* Learning how containers work

---

## Docker Compose

**What it is:**
Docker Compose is a **tool on top of Docker** that lets you define and run **multiple containers together** using a YAML file (`docker-compose.yml` or `compose.yml`).

**What you do with it:**

* Define multiple services (app, database, cache, etc.)
* Start everything with **one command**
* Manage networks and volumes automatically

**Example (multi-container app):**

```yaml
services:
  web:
    image: node:18
    ports:
      - "3000:3000"

  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: example
```

Run it with:

```bash
docker compose up
```

**Best for:**

* Apps with multiple services (web + DB + Redis)
* Local development
* Consistent setups for teams

---

## Key Differences

| Feature               | Docker         | Docker Compose                  |
| --------------------- | -------------- | ------------------------------- |
| Purpose               | Run containers | Orchestrate multiple containers |
| Config style          | Command-line   | YAML file                       |
| Single vs Multi       | Mostly single  | Multiple services               |
| Ease for complex apps | Harder         | Much easier                     |

---

## Simple Analogy

* **Docker** = manually starting machines one by one
* **Docker Compose** = a blueprint that starts **all machines together**

---

## When to use what?

* **Just one container?** → Docker
* **App + DB + cache?** → Docker Compose
* **Production orchestration at scale?** → Kubernetes (next step)

