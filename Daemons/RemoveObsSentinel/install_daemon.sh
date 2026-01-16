#!/usr/bin/bash
sudo touch /etc/systemd/system/remove-obs-sentinel.service

sudo cat <<'EOF' > /etc/systemd/system/remove-obs-sentinel.service
[Unit]
Description=Remove OBS Sentinel on login
After=graphical.target

[Service]
ExecStart=/home/Pigatronee/.config/hypr/scripts/obs/remove_obs_sentinel.sh
Type=oneshot
User=Pigatronee

[Install]
WantedBy=default.target
EOF

sudo systemctl enable --now remove-obs-sentinel
