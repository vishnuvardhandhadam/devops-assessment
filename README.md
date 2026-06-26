# AWS Infrastructure Deployment using Terraform & GitHub Actions

## Architecture Diagram

![Architecture Diagram](architecture/architecture-diagram.png)

---

## AWS Infrastructure

The following screenshot shows the AWS infrastructure successfully created using Terraform.

![AWS Infrastructure](architecture/aws-infrastructure.png)

Resources Created

- EC2 Instance
- IAM Role
- IAM Instance Profile
- Security Group

---

## Terraform Deployment

Terraform successfully created the AWS infrastructure.

![Terraform Apply](architecture/terraform-apply.png)

Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

---

## GitHub Actions CI/CD

GitHub Actions automatically validates and deploys the infrastructure after every push to the **main** branch.

![GitHub Actions](architecture/github-actions-success.png)

Workflow Steps

- Checkout Repository
- Configure AWS Credentials
- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply

---

## Project Architecture

```text
Developer
     │
 Git Push
     │
 GitHub Repository
     │
 GitHub Actions
     │
 Terraform
     │
 AWS
 ├── EC2
 ├── IAM Role
 └── Security Group
     │
 Flask Application
     │
 Public IP
```

---

# Design Decisions

- Terraform was selected as the Infrastructure as Code (IaC) tool for provisioning AWS resources.
- GitHub Actions was chosen to automate validation and deployment.
- AWS EC2 hosts the Flask application.
- IAM Roles provide secure access without embedding AWS credentials.
- A Security Group restricts network access to only the required ports.

---

# Trade-offs Considered

| Decision | Advantage | Trade-off |
|----------|-----------|-----------|
| Single EC2 Instance | Easy to deploy | No High Availability |
| Local Terraform State | Simple setup | Not suitable for team collaboration |
| GitHub Actions | Free and integrated with GitHub | Depends on GitHub-hosted runners |
| Flask Application | Lightweight and fast | Not intended for production-scale workloads |

---

# Cost Awareness

The project was designed to minimize AWS costs.

- Free Tier eligible EC2 instance (where applicable)
- Single EC2 instance
- No Load Balancer
- No Auto Scaling
- Minimal EBS storage
- Security Group configured with only required ports

To avoid unnecessary charges:

```bash
terraform destroy
```

---

# Technologies Used

- AWS EC2
- IAM
- Security Groups
- Terraform
- Git
- GitHub
- GitHub Actions
- Python
- Flask

---

# Project Structure

```text
devops-assessment/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── app/
│   ├── app.py
│   └── requirements.txt
│
├── architecture/
│   ├── architecture-diagram.png
│   ├── aws-infrastructure.png
│   ├── github-actions-success.png
│   └── terraform-apply.png
│
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── security.tf
│   ├── iam.tf
│   ├── outputs.tf
│   └── userdata.sh
│
├── .gitignore
└── README.md
```