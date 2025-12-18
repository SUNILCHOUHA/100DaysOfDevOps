#!/bin/bash
apt update -y
apt install -y nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Terraform Project</title>
</head>
<body>
  <h1>This is my first Terraform project</h1>
</body>
</html>
EOF

systemctl start nginx
systemctl enable nginx
