## 1. Update packages

```bash
sudo apt update
```

---

## 2. Install required dependencies

```bash
sudo apt install ca-certificates curl gnupg lsb-release -y
```

---

## 3. Add Docker’s official GPG key

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor \
  -o /etc/apt/keyrings/docker.gpg
```

---

## 4. Add Docker repository

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee \
/etc/apt/sources.list.d/docker.list > /dev/null
```

---

## 5. Install Docker Engine

```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

---

## 6. Start and enable Docker

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

Check status:

```bash
sudo systemctl status docker
```

---

## 7. Run Docker without sudo (recommended)

```bash
sudo usermod -aG docker $USER
newgrp docker
```

---

## 8. Verify installation

```bash
docker --version
docker run hello-world
```

---