Got it! Here’s the **Git workflow** you followed, structured clearly. I’ll also include it separately in the project documentation later.  

---

# **Git Workflow for Secure Server Deployment**  

## **1. Project Setup & Git Initialization**  
- Created a new directory:  
  ```bash
  mkdir ~/Secure-Server-Deployment
  cd ~/Secure-Server-Deployment
  ```  
- Initialized Git in the project directory:  
  ```bash
  git init
  ```  
- Configured Git with name and email:  
  ```bash
  git config --global user.name "Ekion Lawson-Leng"
  git config --global user.email "omekionstudent.oefe.edu.ng"
  ```  

---

## **2. Website Files Setup & Commit**  
- Created a directory for website files:  
  ```bash
  mkdir website
  ```  
- Copied all HTML and CSS files from `/var/www/html/` into `website/`:  
  ```bash
  cp -r /var/www/html/* ~/Secure-Server-Deployment/website/
  ```  
- Added the `website/` directory to staging:  
  ```bash
  git add website/
  ```  
- Committed the changes:  
  ```bash
  git commit -m "Added website files"
  ```  

---

## **3. Apache Configuration Backup & Commit**  
- Created a directory for Apache configuration backups:  
  ```bash
  mkdir apache-config
  ```  
- Copied the Apache configuration file:  
  ```bash
  cp /etc/apache2/sites-available/000-default.conf ~/Secure-Server-Deployment/apache-config/
  ```  
- Added the `apache-config/` directory to staging:  
  ```bash
  git add apache-config/
  ```  
- Committed the changes:  
  ```bash
  git commit -m "Added apache-config backup"
  ```  

---

## **4. Deployment Script Creation & Commit**  
- Created a deployment script (`deploy.sh`):  
  ```bash
  touch deploy.sh
  ```  
- Edited `deploy.sh` (using a text editor like `nano` or `vim`):  
  ```bash
  nano deploy.sh
  ```  
  **Inside `deploy.sh` (example content):**  
  ```bash
  #!/bin/bash
  sudo cp -r ~/Secure-Server-Deployment/website/* /var/www/html/
  sudo cp ~/Secure-Server-Deployment/apache-config/000-default.conf /etc/apache2/sites-available/000-default.conf
  sudo systemctl restart apache2
  echo "Deployment completed!"
  ```  
- Made the script executable:  
  ```bash
  chmod +x deploy.sh
  ```  
- Added `deploy.sh` to Git staging:  
  ```bash
  git add deploy.sh
  ```  
- Committed the deployment script:  
  ```bash
  git commit -m "Added deployment script"
  ```  

---

## **5. Creating `.gitignore` & Adding Rules**  
- Created a `.gitignore` file to prevent unnecessary files from being tracked:  
  ```bash
  touch .gitignore
  ```  
- Opened `.gitignore` and added rules (example of what might be inside):  
  ```plaintext
  # Ignore system files  
  .DS_Store  
  Thumbs.db  

  # Ignore temporary or sensitive files  
  *.log  
  *.tmp  
  *.bak  
  node_modules/  
  __pycache__/  
  .env  
  ```  
- Added `.gitignore` to staging:  
  ```bash
  git add .gitignore
  ```  
- Committed the changes:  
  ```bash
  git commit -m "Added gitignore rules"
  ```  

---

## **6. Renaming Default Branch to `main`**  
- Checked current branches:  
  ```bash
  git branch
  ```  
- Renamed `master` to `main`:  
  ```bash
  git branch -m master main
  ```  

---

## **7. Setting Up SSH Authentication with GitHub**  
- Checked if SSH agent was running:  
  ```bash
  eval "$(ssh-agent -s)"
  ```  
- Added the private SSH key to the SSH agent:  
  ```bash
  ssh-add ~/.ssh/id_rsa
  ```  
- Copied the **public key** to GitHub (from the local server):  
  ```bash
  cat ~/.ssh/id_rsa.pub
  ```  
  - **Manually copied the output** and added it to GitHub under:  
    - **GitHub → Settings → SSH & GPG Keys → New SSH Key**  

- Verified the SSH connection:  
  ```bash
  ssh -T git@github.com
  ```  

---

## **8. Connecting Local Repository to GitHub**  
- Added remote repository:  
  ```bash
  git remote add origin git@github.com:cmail444/Secure-Web-Server-Deployment.git
  ```  
- Verified the remote repository link:  
  ```bash
  git remote -v
  ```  

---

## **9. Syncing with GitHub Repository**  
- **Pulled from the remote repository first** to avoid conflicts:  
  ```bash
  git pull origin main --allow-unrelated-histories
  ```  
- **Pushed all local changes to GitHub**:  
  ```bash
  git push -u origin main
  ```  

---

## **Final GitHub Repository Structure**
The repository **Secure-Web-Server-Deployment** on GitHub now contains:  
- `website/` → HTML & CSS files  
- `apache-config/` → Apache config backup  
- `deploy.sh` → Deployment script  
- `.gitignore` → Ignored files  
- `README.md` → Project documentation  
