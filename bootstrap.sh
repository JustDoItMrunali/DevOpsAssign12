#!/bin/bash

echo "=== DevOps Assignment Bootstrap Script ==="
echo "Roll Number: ITA771"
echo ""


echo "Step 1: Running Terraform..."
cd terraform
terraform init
terraform apply -auto-approve
terraform output > ../terraform_outputs.txt

echo "Terraform completed!"
echo ""

echo "Step 2: Getting IPs..."
CONTROLLER_IP=$(terraform output -raw controller_public_ip)
MANAGER_IP=$(terraform output -raw swarm_manager_public_ip)
WORKER_A_IP=$(terraform output -raw swarm_worker_a_public_ip)
WORKER_B_IP=$(terraform output -raw swarm_worker_b_public_ip)

echo "Controller: $CONTROLLER_IP"
echo "Manager: $MANAGER_IP"
echo "Worker A: $WORKER_A_IP"
echo "Worker B: $WORKER_B_IP"
echo ""

echo "Step 3: Updating Ansible Inventory..."
cd ../ansible
sed -i '' "s/CONTROLLER_IP_HERE/$CONTROLLER_IP/" inventory.ini
sed -i '' "s/MANAGER_IP_HERE/$MANAGER_IP/" inventory.ini
sed -i '' "s/WORKER_A_IP_HERE/$WORKER_A_IP/" inventory.ini
sed -i '' "s/WORKER_B_IP_HERE/$WORKER_B_IP/" inventory.ini

echo "Step 4: Running Ansible Playbooks..."
ansible-playbook -i inventory.ini ../ansible/site.yml -v

echo ""
echo "=== Bootstrap Complete ==="
echo "Your DevOps stack is deployed!"
