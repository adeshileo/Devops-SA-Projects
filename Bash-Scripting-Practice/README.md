# 🧩 Linux User & Permission Management System

## 📖 Overview
This project simulates a small organization's Linux environment by automating the creation of **users**, **groups**, and **permissions**.  
It enforces access control for different departments and grants specific privileges where needed — a foundational skill for **DevOps Engineers**, **System Administrators**, and **Solution Architects**.

---

## 🎯 Objectives
- Automate user and group management in Linux.
- Apply permission-based access control.
- Grant specific sudo privileges securely.
- Implement a reusable Bash script for rapid setup.

---

## 🧰 Tech Stack
- **Operating System:** Linux (Ubuntu/CentOS)
- **Scripting Language:** Bash
- **Tools:** `useradd`, `groupadd`, `chmod`, `chown`, `sudo`, `cron`

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/adeshileo/Devops-SA-Projects.git
cd Devops-SA-Projects

---

### 2️⃣ Make the Script Executable

```bash
sudo chmod +x create_users.sh

---

### 3️⃣ Run the Script 
```bash
sudo bash create_users.sh

---

### The expected Script Output 

- Create three groups: dev, qa, and ops

- Add users alice, bob, and carol to their respective groups

- Configure departmental folders with proper permissions

- Grant sudo privileges to the ops user

---

### 🧾 Example Output

- Creating group and directory for dev...
- Creating user alice...
- User alice added to group dev.
- Creating group and directory for qa...
- Creating user bob...
- User bob added to group qa.
- Setup complete.

---

### 📁 Directory Permissions Snapshot

- drwxrwx--- root dev /projects/dev
- drwxrwx--- root qa  /projects/qa
- drwxrwx--- root ops /projects/ops

---

### 🔒 Security Notes

- Always modify /etc/sudoers using visudo for syntax validation.

- Limit sudo access only to trusted groups or users.

- Ensure /projects has restricted permissions (chmod 750 for top-level directory if shared).

---
