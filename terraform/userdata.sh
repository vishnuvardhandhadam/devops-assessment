#!/bin/bash

apt update -y
apt install -y python3 python3-pip git

mkdir -p /home/ubuntu/app

cd /home/ubuntu/app

echo "from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello from AWS EC2 using Terraform!'

app.run(host='0.0.0.0', port=5000)" > app.py

echo "Flask==3.0.0" > requirements.txt

pip3 install -r requirements.txt

nohup python3 app.py &