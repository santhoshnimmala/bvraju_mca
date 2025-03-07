
## **11. Deploying Fooocus**

### **1. Create and Activate Fooocus Environment**

```bash
mamba create -n fooocus python=3.10
mamba activate fooocus
```

### **2. Install and Run Fooocus**

```bash
git clone https://github.com/lllyasviel/Fooocus
cd Fooocus
pip install -r requirements_versions.txt
python entry_with_update.py --listen
```

---

### 🎉 **Done!** You now have Open WebUI and Fooocus running on your EC2 instance.

