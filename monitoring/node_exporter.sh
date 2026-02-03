#!/bin/sh


# 1. Create Node Exporter user
sudo useradd --no-create-home --shell /bin/false node_exporter


# 2. Download Node Exporter
cd /tmp
NODE_EXPORTER_VERSION=1.8.1

curl -LO https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz


# 3. Extract archive
tar -xvzf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz
cd node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64


# 4. Install binary
sudo cp node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter


# 5. Create systemd service
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

Restart=always

[Install]
WantedBy=multi-user.target
EOF


# 6. Start and enable Node Exporter
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter


# 7. Allow port (if UFW enabled)
sudo ufw allow 9100
sudo ufw reload

# 8. Verify status
sudo systemctl status node_exporter

