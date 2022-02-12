#!/bin/sh
read -p "Please enter a URL: " URL
echo "You typed: $URL  -- starting now"

sudo mkdir -p /var/www/$URL/html
echo "sudo mkdir -p /var/www/$URL/html"
sudo chown -R $USER:$USER /var/www/$URL/html
echo "sudo chown -R $USER:$USER /var/www/$URL/html"
sudo chmod -R 755 /var/www/$URL
echo "sudo chmod -R 755 /var/www/$URL"
echo "sudo ln -s /etc/nginx/sites-available/$URL /etc/nginx/sites-enabled/$URL"
sudo ln -s /etc/nginx/sites-available/$URL /etc/nginx/sites-enabled/$URL
echo "Adding same html text to: /var/www/$URL/html/index.html"

cat << EOF > /var/www/$URL/html/index.html
<html>
    <head>
        <title>Welcome to $URL!</title>
    </head>
    <body>
        <h1>Success! The $URL server block is working!</h1>
    </body>
</html>
EOF

echo "Adding default config /etc/nginx/sites-available/$URL"

cat << EOF > /etc/nginx/sites-available/$URL
server {
        listen 80;
        listen [::]:80;

        root /var/www/$URL/html;
        index index.html;

        server_name $URL;
        access_log /var/log/nginx/default.access.log;
        error_log /var/log/nginx/default.error.log;
}
EOF
sudo systemctl reload nginx
sudo systemctl restart nginx
