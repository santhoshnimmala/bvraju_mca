# Deploying Open WebUI with Ollama on AWS EC2

This guide explains how to deploy Open WebUI with Ollama on an AWS EC2 instance, install dependencies, and debug common issues.

---

## **1. Deploy EC2 Instance**

- Launch an **AWS EC2** instance with a suitable GPU if using Ollama for AI models.
- Recommended AMI: Ubuntu 20.04 or later.
- Allow required ports (`22`, `8080`, etc.) in the **Security Group**.

---

## **2. Install Mamba (Miniforge)**

```bash
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
```

---

## **3. Run the Miniforge Installer**

```bash
chmod 777 Miniforge3-$(uname)-$(uname -m).sh
bash Miniforge3-$(uname)-$(uname -m).sh
```

Follow the installation instructions.

---

## **4. Create a Virtual Environment for Open WebUI**

```bash
mamba init
mamba create -n openwebui python=3.11
source ~/.bashrc
mamba activate openwebui
```

---

## **5. Install Ollama**

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

---

## **6. Download Models for Ollama**

```bash
ollama pull mistral\ollama pull deepseek-r1
```

---

## **7. Install and Run Open WebUI**

```bash
pip install open-webui
open-webui serve
```

---

## **8. Docker Deployment (Alternative)**

- If you prefer Docker, you can deploy using **Docker Compose**:

```bash
docker compose up -d
```

Ensure you have a valid `docker-compose.yml` file for Open WebUI.

---

## **9. Useful Debugging Commands**

If you encounter issues, check if the port `8080` is in use:

```bash
sudo lsof -i :8080
```

Kill the process using port `8080` (replace `PID` with the actual process ID):

```bash
sudo kill -9 PID
```

To check running processes:

```bash
ps aux | grep open_webui
```

---

## **10. Access Open WebUI**

Once the server is running, open:

```
http://<EC2-PUBLIC-IP>:8080
```

Replace `<EC2-PUBLIC-IP>` with your instance’s public IP.

---

### 🎉 **Done!** You now have Open WebUI running with Ollama on your EC2 instance.

