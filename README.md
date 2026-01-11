# 🚀 DevOps Project: Automated REST Service Deployment

This project demonstrates a full **CI/CD and Infrastructure as Code (IaC)** pipeline. It automates the provisioning of AWS cloud infrastructure and the deployment of a containerized REST application.

---

### 🛠 Technologies Used
* **Infrastructure:** AWS (EC2, Security Groups, Key Pairs)
* **IaC:** Terraform
* **Configuration Management:** Ansible
* **Containerization:** Docker
* **CI/CD:** GitHub Actions & GitHub Container Registry (GHCR)

---

### 📐 Architecture Overview
* **CI Pipeline:** GitHub Actions builds a Docker image from the source code and pushes it to GHCR.
* **Infrastructure:** Terraform provisions an EC2 instance in the `eu-north-1` (Stockholm) region.
* **Deployment:** Ansible connects to the new instance, installs Docker, and pulls/runs the container from GHCR.

---

### 📂 Project Structure
* `/terraform`: Contains `main.tf` for AWS resource provisioning.
* `/ansible`: Contains the inventory (`hosts`) and playbook (`deploy.yml`) for server setup.
* `/.github/workflows`: The automated build and push pipeline.

---

### 🚦 How to Run

1. **Provision:** Run `terraform apply` inside the `/terraform` folder.
2. **Deploy:** Run `ansible-playbook -i hosts deploy.yml` inside the `/ansible` folder.
3. **Access:** Open the server's public IP in your browser on Port 80.
