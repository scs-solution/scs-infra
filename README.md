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
echo "aws_instance.web.public_ip" | .\terraform.exe console
ssh -i ~/.ssh/web_admin ec2-user@~~
```
