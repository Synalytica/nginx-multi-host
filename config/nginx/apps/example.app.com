server {
    listen 80;

    server_name example.app.com;

    location / {
        proxy_pass http://hostname:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

