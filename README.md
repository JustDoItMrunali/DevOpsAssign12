
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
- **Test User**: Username: ITA771, Password: 2022PE0000

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
