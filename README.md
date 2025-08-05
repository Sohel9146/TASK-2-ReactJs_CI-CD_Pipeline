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

## 🖼️**[Screenshot: Jenkins Stage Output]**
![Screenshot: Jenkins Stage Output](https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline/blob/main/screenshots/Jenkins%20Stage%20Output.png?raw=true)

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

## 🖼️**[Screenshot: GitHub Webhook Setup]**
![Screenshot: GitHub Webhook Setup](https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline/blob/main/screenshots/GitHub%20Webhook%20Setup.png?raw=true)  

## 🖼️**[Screenshot: GitHub Commit Triggering Build]**
![Screenshot: GitHub Commit Triggering Build](https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline/blob/main/screenshots/GitHub%20Commit%20Triggering%20Build.png?raw=true)

## 🖼️**[Screenshot: ngrok Terminal with Public URL]**
![Screenshot: ngrok Terminal with Public URL](https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline/blob/main/screenshots/ngrok%20Terminal%20with%20Public%20URL.png?raw=true)

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
## 🖼️**[Screenshot: React App Running on Browser]**
![Screenshot: React App Running on Browser](https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline/blob/main/screenshots/React%20App%20Running%20on%20Browser.png?raw=true)

## 🖼️**[Screenshot: Docker Container Running]**
![Screenshot: Docker Container Running](https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline/blob/main/screenshots/Docker%20Container%20Running.png?raw=true)


---

## 🖼️ Screenshot Index

| Screenshot                             |          Description                      |
|----------------------------------------|-------------------------------------------|
| **Jenkins Stage Output.png**           | Console log of successful build           |
| **GitHub Webhook Setup.png**           | GitHub webhook configuration              |
| **GitHub Commit Triggering Build.png** | GitHub commit history triggering pipeline |
| **ngrok Terminal with Public URL.png** | Terminal showing ngrok public URL         |
| **React App Running on Browser.png**   | React app running in browser              |
| **Docker Container Running.png**       | Docker container running with app         |

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
│   ├── Docker Container Running.png
│   ├── GitHub Commit Triggering Build.png
│   ├── GitHub Webhook Setup.png
│   ├── Jenkins Stage Output.png
│   ├── ngrok Terminal with Public URL.png
│   ├── React App Running on Browser.png
```

---

## 📤 Submission

This repo was submitted as part of **Task 2 – DevOps Internship**.  
GitHub Webhooks and CI/CD automation using Jenkins are fully implemented and verified.

---

## 🙋 Interview Questions Covered

1. What is Jenkins and why is it used in DevOps?
Jenkins is an open-source automation server that helps developers and DevOps teams automate the process of building, testing, and deploying applications.

🔹 In DevOps, Jenkins plays a critical role by enabling Continuous Integration (CI) and Continuous Deployment (CD).
🔹 It monitors your version control system (like GitHub), and every time a developer pushes code, Jenkins automatically runs jobs like testing, building Docker images, and deploying to servers or Kubernetes.

2. How does a Jenkinsfile work?
A Jenkinsfile is a text file that contains the scripted instructions Jenkins follows to run your CI/CD pipeline.

🔹 It defines pipeline stages such as Build, Test, Deploy, etc.
🔹 It’s stored inside your project repository (like on GitHub), so your pipeline is version-controlled with your code.
🔹 Jenkins reads the Jenkinsfile and runs each stage sequentially or in parallel, depending on your configuration.

3. What is the purpose of multistage Docker builds?
Multistage Docker builds are used to create smaller, cleaner, and more secure Docker images.

🔹 You use one stage (like builder) to compile or build your app (e.g., using node:18).
🔹 Then, you use a second stage (like nginx:alpine) to copy only the final output (e.g., React build/ folder).
🔹 This removes all unnecessary files and tools (like source code, node_modules, build tools) from the final image.

4. How do GitHub webhooks integrate with Jenkins?
GitHub webhooks allow GitHub to automatically notify Jenkins whenever an event happens (like pushing code to a branch).

🔹 When a push or pull request happens, GitHub sends a webhook payload (a small JSON message) to Jenkins.
🔹 Jenkins then triggers a job automatically — no need to click “Build Now”.

5. What happens in each stage of a typical CI/CD pipeline?
A typical Jenkins CI/CD pipeline includes several key stages:

🛠️ 1. Checkout / Clone Code
Pulls the latest code from GitHub using git.

📦 2. Install Dependencies
Installs required libraries or modules (npm install, pip install, etc.).

🧪 3. Run Tests
Executes unit, integration, or UI tests to ensure the code works.

🏗️ 4. Build
Compiles or bundles the application (like npm run build for React).

🐳 5. Build Docker Image
Packages the app into a Docker image, ready for deployment.

🚀 6. Deploy
Deploys the image to production, staging, or Kubernetes, or runs a Docker container.

✅ 7. Post-build Actions
Notifications (Slack, email), clean-up, or archiving artifacts.

---

> 👨‍💻 Maintained by: [Sohel Shaikh]  
> 🔗 GitHub: [https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline.git](https://github.com/Sohel9146/TASK-2-ReactJs_CI-CD_Pipeline.git)
