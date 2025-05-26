# CI-CD-project

# 🚀 CI/CD Pipeline with AWS CodeBuild and Terraform

This project demonstrates how to implement a full CI/CD pipeline using **AWS CodeBuild** to automatically deploy infrastructure using **Terraform**. The setup provisions a VPC, subnet, security groups, and an EC2 instance — with the public IP displayed as an output. The pipeline is triggered on **GitHub push and pull request merge events**.

---

##  Key Features

- GitHub integration with webhook triggers
- S3 backend for storing Terraform state
- Infrastructure provisioning with Terraform (VPC, Subnet, SG, EC2)
- CI/CD pipeline managed with AWS CodeBuild
- Use of environment variables for secure credentials
- Bash scripts to automate setup and deployment

---

## Technologies Used

- **AWS CodeBuild**
- **Terraform**
- **AWS CLI**
- **S3 (for state backend)**
- **Bash**
- **GitHub**

---

