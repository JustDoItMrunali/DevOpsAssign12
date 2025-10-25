# Deployment Guide - ITA771

## Prerequisites

- AWS Account with IAM user having AdministratorAccess
- MacBook with installed: Terraform, Ansible, Docker, AWS CLI
- GitHub account

## Step 1: Configure AWS CLI
```bash
aws configure
# Enter your IAM user credentials
# Region: us-east-1
# Output: json
```

## Step 2: Setup GitHub SSH
```bash
# Add SSH key to GitHub
cat ~/.ssh/id_rsa.pub
# Copy and paste in GitHub Settings → SSH Keys
```

## Step 3: Clone Repository
```bash
git clone https://github.com/YOUR_USERNAME/DevOps_Assignment.git
cd DevOps_Assignment
git checkout ITA771
```

## Step 4: Run Bootstrap
```bash
# Make script executable
chmod +x bootstrap.sh

# Run it
./bootstrap.sh

# This will:
# - Create Terraform infrastructure (4 EC2 instances)
# - Get Elastic IPs
# - Configure Ansible inventory
# - Install Docker on all servers
# - Initialize Docker Swarm
# - Deploy the application stack
```

## Step 5: Verify Deployment
```bash
# SSH to manager
ssh -i terraform/terraform-key-ITA771.pem ubuntu@MANAGER_IP

# Check services
docker service ls
docker service ps myapp_web
docker service ps myapp_db

# Check database
docker exec -it $(docker ps -q -f label=service=myapp_db) \
  psql -U postgres -d postgres -c "SELECT * FROM login;"
```

## Step 6: Access Application

Open browser: http://MANAGER_IP:8000

- Register: Enter username (ITA771) and password (2022PE0000)
- Login: Use registered credentials
- Home: Should see "Hello ITA771 How are you"

## Cleanup

To destroy all infrastructure:
```bash
cd terraform
terraform destroy -auto-approve
```

