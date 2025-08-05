# 🚀 DevOps Task 2: Jenkins CI/CD Pipeline for React.js App

This project demonstrates a complete CI/CD pipeline setup using **Jenkins**, **Docker**, and **GitHub Webhooks** to automate the build and deployment of a React.js application.

---

## 📌 Objective

- Set up Jenkins to automatically build and deploy a React.js app on each code commit.
- Use a `Jenkinsfile` to define pipeline stages: clone, install, build, dockerize, and deploy.
- Integrate **GitHub webhook** to auto-trigger the pipeline.

---

## 🧰 Tools Used

- ✅ React.js (Frontend)
- ✅ Jenkins (Automation)
- ✅ Docker (Containerization)
- ✅ GitHub (Source code + Webhook)
- ✅ Nginx (Production server for React)
- ✅ ngrok (To expose local Jenkins for webhook)

---

## 🧪 Pipeline Stages (Defined in `Jenkinsfile`)

| Stage | Description |
|-------|-------------|
| **Clone** | Clone code from GitHub |
| **Install** | Run `npm install` to get dependencies |
| **Build** | Run `npm run build` to generate production files |
| **Docker Build** | Build Docker image using multistage Dockerfile |
| **Docker Run** | Deploy app inside container using Nginx |

🖼️ **[Screenshot: Jenkins Stage Output](screenshots/console-output.png)**

---

## 🐳 Dockerfile Overview

A multistage `Dockerfile` is used:
- **Stage 1 (Builder)**: Uses Node.js to install and build the React app.
- **Stage 2 (Nginx)**: Copies the build output and serves it with Nginx.

> See `Dockerfile` in this repo for full content.

---

## 🔁 Webhook Integration

- Configured GitHub Webhook to call:
  ```
  http://<ngrok-public-url>/github-webhook/
  ```
- Jenkins is configured with:
  - ✅ “GitHub hook trigger for GITScm polling”
- On every code commit to the GitHub repo, the pipeline is triggered automatically.

🖼️ **[Screenshot: GitHub Webhook Setup](screenshots/webhook-setup.png)**  
🖼️ **[Screenshot: GitHub Commit Triggering Build](screenshots/github-commit.png)**  
🖼️ **[Screenshot: ngrok Terminal with Public URL](screenshots/ngrok-terminal.png)**

---

## 🚀 How to Run Locally (Manual Docker Run)

```bash
# Build Docker Image
docker build -t react-jenkins-app .

# Run the container
docker run -d -p 80:80 react-jenkins-app

# Open in browser
http://localhost
```

🖼️ **[Screenshot: React App Running on Browser](screenshots/react-browser.png)**  
🖼️ **[Screenshot: Docker Container Running](screenshots/docker-ps.png)**

---

## 🖼️ Screenshot Index

| Screenshot | Description |
|------------|-------------|
| **jenkins-dashboard.png** | Jenkins UI showing pipeline project |
| **console-output.png** | Console log of successful build |
| **webhook-setup.png** | GitHub webhook configuration |
| **github-commit.png** | GitHub commit history triggering pipeline |
| **ngrok-terminal.png** | Terminal showing ngrok public URL |
| **react-browser.png** | React app running in browser |
| **docker-ps.png** | Docker container running with app |

---

## 📁 Folder Structure

```
├── Dockerfile
├── Jenkinsfile
├── README.md
├── package.json
├── public/
├── src/
├── screenshots/
│   ├── jenkins-dashboard.png
│   ├── console-output.png
│   ├── webhook-setup.png
│   ├── github-commit.png
│   ├── ngrok-terminal.png
│   ├── react-browser.png
│   └── docker-ps.png
```

---

## 📤 Submission

This repo was submitted as part of **Task 2 – DevOps Internship**.  
GitHub Webhooks and CI/CD automation using Jenkins are fully implemented and verified.

---

## 🙋 Interview Questions Covered

1. What is Jenkins and why is it used in DevOps?
2. How does a Jenkinsfile work?
3. What is the purpose of multistage Docker builds?
4. How do GitHub webhooks integrate with Jenkins?
5. What happens in each stage of a typical CI/CD pipeline?

---

> 👨‍💻 Maintained by: [Your Name]  
> 🔗 GitHub: [https://github.com/your-username/your-repo-name](https://github.com/your-username/your-repo-name)
