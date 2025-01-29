# Secure Web Server Deployment

## Overview
Deploy a secure Apache web server with a basic web application, managing service processes and automating Apache startup with SystemD. The setup includes strict user and group access controls, adherence to CIS security guidelines, and firewall configurations to restrict SSH and web access.

## Features
- Secure Apache web server deployment
- Automated Apache startup with SystemD
- User and group access control enforcement
- Firewall configuration for SSH and web security
- Git versioning for configuration management

## Installation & Setup
### Prerequisites
Ensure you have the following:
- A Linux-based server (Ubuntu recommended)
- Apache installed (`sudo apt install apache2`)
- Git installed (`sudo apt install git`)

### Setup Steps
1. Clone the repository:
   ```bash
   git clone git@github.com:Timeo444/Secure-Web-Server-Deployment.git
   cd Secure-Web-Server-Deployment
   ```
2. Deploy the web application:
   ```bash
   sudo cp -r website/* /var/www/html/
   ```
3. Configure Apache:
   ```bash
   sudo cp apache-config/000-default.conf /etc/apache2/sites-available/
   sudo systemctl restart apache2
   ```
4. Set up firewall rules:
   ```bash
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   sudo ufw enable
   ```
5. Enable Apache on startup:
   ```bash
   sudo systemctl enable apache2
   ```

## Usage Guide
- Modify website content inside the `website/` directory.
- Update Apache configurations in `apache-config/`.
- Restart the server after changes:
  ```bash
  sudo systemctl restart apache2
  ```

## Deployment Instructions
To automate deployment, execute the provided script:
```bash
chmod +x deploy.sh
./deploy.sh
```
This script sets up the web server, configures Apache, and applies security settings.

## Repository Structure
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

For detailed technical documentation, refer to `docs/Full-Project-Documentation.md`. 

