
# CI/CD Pipeline with AWS CodeBuild and Terraform

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



---

## 🚀 Setup Instructions

### 1. Create and Clone GitHub Repository

```bash
git clone https://github.com/your-username/terraform-codebuild-cicd.git
cd terraform-codebuild-cicd
````

### 2. Create IAM User

* Create a user with **programmatic access**
* Attach the following AWS policies:

  * `AdministratorAccess`
  

### 3. Write Bash Scripts

Create the following bash scripts:

* `install-techmax.sh`: Installs dependencies or any required packages.
* `configure-profile.sh`: Configures an AWS named profile using AWS CLI.
* `apply-terraform.sh`: Executes Terraform commands to deploy infrastructure.

### 4. Create S3 Bucket for Terraform State

```bash
aws s3 mb s3://your-terraform-state-bucket-name
```

Update your `backend` block in `ec2.tf` to point to this bucket.

### 5. Write Terraform Scripts

Define the infrastructure in `ec2.tf` file

* Create a VPC
* Subnet
* Security Group
* EC2 instance
* Output the public IP of the EC2 instance

### 6. Create `buildspec.yml`

Define the build steps in `CICD/buildspec.yml`:

```yaml
version: 0.2

phases:
  install:
    commands:
      - chmod +x scripts/*.sh
      - ./scripts/install-techmax.sh
  pre_build:
    commands:
      - ./scripts/configure-profile.sh
  build:
    commands:
      - ./scripts/apply-terraform.sh
```

### 7. Set Environment Variables in CodeBuild

In your CodeBuild project, specify the following environment variables:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_REGION`
* `AWS_PROFILE`

### 8. Create CodeBuild Project

* Source: GitHub (via AWS Connections)
* Buildspec file: `CICD/buildspec.yml`
* Enable **“Rebuild every time a code change is pushed to this repository”**

### 9. Set Up Webhook Event Filters

* In CodeBuild, configure webhook triggers for:

  * **Push to main**
  * **Pull request merges**

---

##  Output

After a successful build, you’ll see the public IP address of the EC2 instance in the Terraform output:

---

## Visual Overview of CI/CD Pipeline

![Installing Dependencies](Screenshot%20(5599).png)
![Code build](Screenshot%20(5601).png)
![Successful Build Projects](Screenshot%20(5602).png)
![site is up and running](Screenshot%20(5600).png)

