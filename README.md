# Secure Web Server Deployment - Full Documentation

## Table of Contents
1. [Introduction](#introduction)
2. [Project Goals](#project-goals)
3. [IT Structure and Explanations](#it-structure-and-explanations)
4. [Setting Up the Project](#setting-up-the-project)
5. [Git Workflow](#git-workflow)
6. [Deployment Process](#deployment-process)
7. [Server Configuration](#server-configuration)
8. [Security Best Practices](#security-best-practices)
9. [Troubleshooting and Common Issues](#troubleshooting-and-common-issues)
10. [Conclusion](#conclusion)

---

## Introduction
This documentation serves as a comprehensive guide for setting up, deploying, and maintaining a secure web server with Apache. It covers all essential aspects, including Git version control, security measures, and troubleshooting.

---

## Project Goals
- Deploy a secure Apache web server.
- Automate deployment via a script.
- Maintain strict version control.
- Implement security best practices.
- Ensure high availability and scalability.

---

## IT Structure and Explanations
**Technology Stack:**
- **Operating System:** Ubuntu 20.04 LTS
- **Web Server:** Apache 2
- **Version Control:** Git & GitHub
- **Firewall:** UFW (Uncomplicated Firewall)
- **Authentication:** SSH with key-based authentication

**Directory Structure:**
```
Secure-Web-Server-Deployment/  
│  
├── website/                  # Contains all HTML and CSS files for the website  
│   ├── index.html            # Main HTML file  
│   ├── style.css             # Stylesheet  
│   └── ...                   # Additional website assets  
│  
├── apache-config/            # Contains Apache configuration files  
│   └── 000-default.conf      # Apache site configuration  
│  
├── deploy.sh                 # Deployment script for automating tasks  
├── .gitignore                # Git ignore rules  
├── README.md                 # Project summary and usage guide  
└── docs/                     # Additional project documentation  
    └── Full-Project-Documentation.md  
```

---

## Setting Up the Project
### Prerequisites
Ensure the following are installed:
- **Apache Web Server**
  ```bash
  sudo apt update  
  sudo apt install apache2  
  ```
- **Git**
  ```bash
  sudo apt install git  
  ```
- **SSH Key Setup for GitHub**
  ```bash
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"  
  eval "$(ssh-agent -s)"  
  ssh-add ~/.ssh/id_rsa  
  ```

### Installation Steps
1. Clone the repository:
   ```bash
   git clone git@github.com:yourusername/Secure-Web-Server-Deployment.git  
   cd Secure-Web-Server-Deployment  
   ```
2. Copy the HTML and CSS files to the Apache directory:
   ```bash
   sudo cp -r website/* /var/www/html/  
   ```
3. Backup and apply Apache configuration:
   ```bash
   sudo cp apache-config/000-default.conf /etc/apache2/sites-available/000-default.conf  
   sudo systemctl restart apache2  
   ```
4. Run the deployment script:
   ```bash
   chmod +x deploy.sh  
   ./deploy.sh  
   ```

---

## Git Workflow
### 1. Initializing the Project
```bash
git init
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```
### 2. Adding and Committing Changes
```bash
git add .
git commit -m "Initial commit"
```
### 3. Pushing to Remote Repository
```bash
git remote add origin git@github.com:yourusername/Secure-Web-Server-Deployment.git
git push -u origin main
```

---

## Deployment Process
### Setting Up Apache
```bash
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
```
### Configuring Firewall
```bash
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```
### Deploying Web Files
```bash
sudo mv website/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
```
### Restarting Apache
```bash
sudo systemctl restart apache2
```

---

## Server Configuration
### Setting Up Users and Permissions
```bash
sudo useradd -m -G admin youruser
sudo usermod -aG sudo youruser
```
### Enabling SSH Access
```bash
sudo ufw allow OpenSSH
sudo systemctl restart ssh
```
### Enforcing Secure Access
```bash
sudo nano /etc/ssh/sshd_config
# Set PasswordAuthentication no
# Set PermitRootLogin no
sudo systemctl restart ssh
```

---

## Security Best Practices
- Use **SSH Key Authentication**
- **Disable root login**
- **Restrict file permissions**
- **Regularly update packages**
- **Monitor logs using fail2ban**
  ```bash
  sudo apt install fail2ban
  sudo systemctl enable fail2ban
  ```

---

## Troubleshooting and Common Issues
### Apache Not Starting
```bash
sudo systemctl status apache2
sudo journalctl -xe
```
### Firewall Blocking Access
```bash
sudo ufw status
sudo ufw allow 80/tcp
```
### Website Not Loading
```bash
sudo tail -f /var/log/apache2/error.log
```

---

## Conclusion
This documentation provides a structured approach to setting up and maintaining a secure web server deployment. Follow these guidelines to ensure a smooth and secure deployment process.


