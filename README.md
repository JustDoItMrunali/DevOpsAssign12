<img width="1470" height="920" alt="Screenshot 2025-10-25 at 9 45 08 PM" src="https://github.com/user-attachments/assets/4539e1ed-a3c9-48fc-a2d8-c6fbfbf2e685" />
<img width="1470" height="920" alt="Screenshot 2025-10-25 at 9 45 22 PM" src="https://github.com/user-attachments/assets/cb460f30-9464-4977-a766-3d6fefcd4523" />
<img width="1444" height="827" alt="Screenshot 2025-10-25 at 9 45 29 PM" src="https://github.com/user-attachments/assets/06d264dc-4d4b-4e88-ad54-10ed40fef4f1" />

DevOps_Assignment/
├── terraform/           # Infrastructure as Code
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform-key-ITA771.pem
├── ansible/            # Configuration Management
│   ├── inventory.ini
│   ├── site.yml
│   └── playbooks/
│       ├── 01-install-docker.yml
│       ├── 02-init-swarm.yml
│       └── 03-deploy-stack.yml
├── docker/            # Container Definitions
│   ├── docker-compose.yml
│   ├── web/
│   │   └── Dockerfile
│   └── db/
│       ├── Dockerfile
│       └── init.sql
├── django_app/        # Django Application
│   ├── manage.py
│   ├── devops_app/
│   ├── login/
│   └── requirements.txt
├── scripts/           # Helper Scripts
│   └── bootstrap.sh
├── ci/               # CI/CD Configuration
│   └── github_actions/
│       └── deploy.yml
├── selenium/         # Automated Tests
│   └── test_login_app.py
└── README.md

### Quick Start
```bash
# Run bootstrap script to deploy everything
./scripts/bootstrap.sh

# Or manually:

# 1. Terraform
cd terraform
terraform init
terraform apply -auto-approve

# 2. Ansible
cd ../ansible
ansible-playbook -i inventory.ini site.yml

# 3. Deploy Django Stack
docker stack deploy -c docker/docker-compose.yml myapp
```

### Features

- ✅ Django Login/Register Application
- ✅ PostgreSQL Database with Docker
- ✅ Docker Swarm Orchestration (2 web replicas)
- ✅ Terraform Infrastructure (4 EC2 instances + EIPs)
- ✅ Ansible Configuration Management
- ✅ GitHub Actions CI/CD Pipeline
- ✅ Selenium Automated Tests

### Credentials

- **Django Admin**: Username: admin, Password: admin
- **PostgreSQL**: Username: postgres, Password: postgres_password
- **Test User**: Username: ITA745, Password: 2022PE0366

### Infrastructure

- 1 Controller (Terraform/Ansible/CI)
- 1 Swarm Manager (Docker Swarm)
- 2 Swarm Workers (Django Web + PostgreSQL)
- All on t2.micro (AWS Free Tier)

### Access

- Django App: http://MANAGER_IP:8000
- Admin Panel: http://MANAGER_IP:8000/admin

### Testing
```bash
# Run Selenium tests
python -m unittest selenium.test_login_app -v
```
