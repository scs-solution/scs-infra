# SCS Infra

https://www.44bits.io/ko/post/terraform_introduction_infrastrucute_as_code

## Command

### SSH Key

```sh
ssh-keygen -t rsa -b 4096 -C "rollrat.cse@gmail.com" -f "$HOME/.ssh/web_admin" -N ""
```

### Find Ami

```sh
sudo pip3 install awscli
aws configure
aws ec2 describe-images --owners self amazon --filters "Name=root-device-type,Values=ebs"
```

### Sync Cloud

```sh
terraform apply -auto-approve
```

### Get IP Address of Instance

```sh
# ec2
echo "aws_instance.web.public_ip" | terraform.exe console
ssh -i ~/.ssh/web_admin ec2-user@~~
# rds
echo "aws_db_instance.web_db.endpoint" | terrafrom.exe console
```

### Destroy

```sh
terraform plan -destroy
terraform destroy
```


### nginx.conf

```conf
        location /api {
                proxy_pass http://127.0.0.1:3000/api;
        }

        location /api-docs {
                proxy_pass http://127.0.0.1:3000/api-docs;
        }

        location / {
                try_files $uri /index.html;
        }

        location /monitor {
                proxy_pass http://127.0.0.1:8080/api/v1.0;
        }
        
        location /monitor {
                proxy_pass http://127.0.0.1:8080/api/v1.0;
        }
        
        location /ssh/ {
                proxy_pass http://127.0.0.1:8888/;
                proxy_http_version 1.1;
                proxy_read_timeout 300;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
                proxy_set_header Host $http_host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Real-PORT $remote_port;
        }
```
