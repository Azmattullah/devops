#!/bin/sh


sudo systemctl stop prometheus || true
sudo rm -f /usr/local/bin/prometheus /usr/local/bin/promtool
sudo rm -rf /etc/prometheus /var/lib/prometheus
sudo rm -f /etc/systemd/system/prometheus.service

sudo apt install unzip -y

# 1. Create Prometheus user and directories
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus /var/lib/prometheus


# 2. Download Promethes
cd /tmp
PROM_VERSION=2.49.1

curl -LO https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/prometheus-${PROM_VERSION}.linux-amd64.tar.gz

ls -lh prometheus-${PROM_VERSION}.linux-amd64.tar.gz
tar -xvzf prometheus-${PROM_VERSION}.linux-amd64.tar.gz
cd prometheus-${PROM_VERSION}.linux-amd64


# 3. Install binaries
sudo cp prometheus promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool


# 4. Install configuration and consoles
sudo mkdir -p /etc/prometheus /var/lib/prometheus
sudo cp -r consoles console_libraries /etc/prometheus/
sudo cp prometheus.yml /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus


# 5. Create systemd service
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus \
  --web.console.templates=/etc/prometheus/consoles \
  --web.console.libraries=/etc/prometheus/console_libraries

Restart=always

[Install]
WantedBy=multi-user.target
EOF

# 6. Start and enable Prometheus
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

# 7. Allow Prometheus port (if UFW enabled)
sudo ufw allow 9090
sudo ufw reload


# 8. Verify Status
sudo systemctl status prometheus

