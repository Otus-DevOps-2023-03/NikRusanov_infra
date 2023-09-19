# HW-03 Infra

## Bastion

### Create ssh-keys

```sh
ssh-keygen -t rsa -f ~/.ssh/nik -C nik -P ""
cat ~/.ssh/nik.pub
```
Add `nik.pub` to yandex cloud.

### Start ssh-agent and add key

```sh
 eval `ssh-agent`
 ssh-add ~/.ssh/<private_key>
```
Current public keys in agent:
```sh
ssh-add -L
```
### Connect to internal host with bastion

1. With ProxyJump ssh flag:
    `ssh -A -J <bastion_host> <internal_host>`

2. With ssh-config
    Create `~/.ssh/config:

    ```sh
    Host bastion
    HostName <Your bastion IP>
    User appuser

    Host internal-host
    HostName  <Your Internal-host ip>
    ProxyJump bastion
    User appuser
    ```
    2.2 Connect to internal:

    ```sh
    ssh internal-host
    ```
## VPN Installation

Connect to bastion host and run:

```sh
cat <<': cat <<EOF> setupvpn.sh
#!/bin/bash -e
echo "deb http://repo.pritunl.com/stable/apt jammy main" | sudo tee /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
curl https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc | sudo apt-key add -
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc |  gpg --dearmor | sudo tee /usr/share/keyrings/mongodb.gpg > /dev/null
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
apt update
apt install -y wireguard wireguard-tools
ufw disable
apt install -y pritunl mongodb-org
systemctl enable mongod pritunl
systemctl start mongod pritunl
EOF
chmod +x setupvpn.sh
./setupvpn.sh
```
After install open `https://<bastion_host>/login` in browser
On bastion_host set mongo-db uri:
```sh
   sudo pritunl set-mongodb mongodb://localhost:27017/pritunl
   sudo pritunl setup-key
```
Copy generated key to browser
Generate default-password:
```sh
    sudo pritunl default-password
```
Copy generated username and password to browser
# Add LetsEncrypt SSL Certificate

Add domain <ip>.sslip.io in pritunl

![Alt screen1](./screens/screen1.png)

# Ips

bastion_IP = 51.250.75.167

someinternalhost_IP = 10.128.0.18


# HW-04 CloudApp

## Create cloud instance:

` yc compute instance create   --name reddit-app   --hostname reddit-app   --memory=4   --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB   --network-interface subnet-name=default-ru-central1-b,   nat-ip-version=ipv4   --metadata serial-port-enable=1   --ssh-key ~/.ssh/appuser.pub`

## Startup manual:

  - Run Create instance
  - Copy scripts:
     `deploy.sh`
     `install_mongodb.sh`
     `install_ruby.sh`
     `startup.sh`
  - Run `startup.sh` on instance

## Startup auto

  Execute `yc_instance_create.sh` script

## Ips

testapp_IP = 158.160.67.56

testapp_port = 9292

# HW-05 Packer

## Create service yc account

```
FOLDER_ID=$(yc config list | grep folder-id  | cut -d ":" -f2 | xargs)
SERVICE_NAME="serviceacc"
yc iam service-account create --name=$SERVICE_NAME --folder-id=$FOLDER_ID
# Access rules
ACCT_ID=$(yc iam service-account get $SERVICE_NAME | \
          grep ^id | \
                    awk '{print [}')
                    echo "ACCT_ID=$ACCT_ID"
                    yc resource-manager folder add-access-binding --id $FOLDER_ID --service-account-id $ACCT_ID \
                        --role editor

#  create IAM key
 yc iam key create --service-account-id $ACCT_ID --output ./key.json
 ']}')
 
```

## Install packer

` wget https://hashicorp-releases.yandexcloud.net/packer/1.8.6/packer_1.8.6_linux_amd64.zip && unzip packer_1.8.6_linux_amd64.zip `
Add to PATH var or copy packer to /usr/bin

## Create vm image:

`cd packer &&  packer build   -var-file=variables.json ./immutable.json `

## Create compute instance

`config-scripts/create-reddit-vm.sh`

## Ips

testapp_IP = 130.193.51.233

testapp_port = 9292


# HW-06 terraform-1

## Structure
- `terraform/main.tf` describes creation instances reddit-app
- `terraform/outputs.tf`  - output variables in stdout
- `terraform/variables.tf` - describes variables
- `terraform/tfvars.example` - example of vars initialize 
- `terraform/lb.tf` - network load balancer

## Deploy

- Create yc service account and add editor permission.
- Enter in `terraform` directory
- Run commands: 
   ```
    terraform init
    terraform apply
   ```
## Run Check

`terraform output | grep external_ip_address_lb`

Open in browser http://external_ip_address_lb



## HW-07 terraform 2

 - Crate packer images for db and app
 - Create modules app,db,vpc
 - Create stage and prod environment based by modules
 - Create access-key for backend storage
 - Create storage for terraform.tfstate
 - Add provisioners for autostart db and app

## Run
  - Go to stage/prod directory
  - Run commands: 
   ```
    terraform init
    terraform apply
   ```

