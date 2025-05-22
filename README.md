# Apache Web Server on AWS EC2 using Terraform

This project provisions an AWS EC2 instance and sets up an **Apache HTTP Server** on it using **Terraform**. The setup follows a modular approach, separating the networking and compute resources for better scalability and reuse.

---

## What This Project Does

- Creates a custom **VPC** with a **public subnet**
- Deploys a **t2.micro EC2 instance** running **Apache**
- Configures a **security group** allowing HTTP (port 80) and SSH (port 22) traffic
- Uses Terraform **modules** for clean separation of concerns

---

## Project Structure

```bash
apache-aws-ec2/
│
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── compute/
│       ├── main.tf  # Contains EC2 + Apache provisioning
│       ├── outputs.tf
│       └── variables.tf
