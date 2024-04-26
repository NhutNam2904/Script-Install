#!/bin/bash

apt update
apt install -y nginx

if ! [ -x "$(command -v nginx)" ]; then
    echo "Cài đặt Nginx không thành công. Vui lòng kiểm tra lại." >&2
    exit 1
fi

echo "Nginx đã được cài đặt thành công."

systemctl start nginx
systemctl enable nginx

ip_address=$(hostname -I | awk '{print $1}')
echo "Bạn có thể truy cập vào máy chủ của bạn qua địa chỉ IP sau: $ip_address"

exit 0
