#!/bin/bash
# WEB VM 첫 부팅 때 cloud-init이 1회 실행
set -e

apt-get update
apt-get install -y nginx

echo "<h1>WEB: $(hostname)</h1>" > /var/www/html/index.html

systemctl enable --now nginx
