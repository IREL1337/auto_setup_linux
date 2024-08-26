#!/bin/bash

# Periksa apakah script dijalankan dengan hak akses root
if [[ $EUID -ne 0 ]]; then
   echo "Script ini harus dijalankan dengan hak akses root." 
   exit 1
fi

echo "Memulai auto-setup untuk Node.js, npm, Python, dan pip..."

# Update sistem
echo "Mengupdate sistem..."
apt-get update -y
apt-get upgrade -y

# Install curl jika belum terinstal
if ! command -v curl &> /dev/null
then
    echo "Menginstall curl..."
    apt-get install curl -y
fi

# Install Node.js dan npm
echo "Menginstall Node.js dan npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Periksa instalasi Node.js dan npm
echo "Memeriksa instalasi Node.js dan npm..."
node_version=$(node -v)
npm_version=$(npm -v)
echo "Node.js versi $node_version dan npm versi $npm_version telah terinstal."

# Install Python dan pip
echo "Menginstall Python dan pip..."
apt-get install -y python3 python3-pip

# Periksa instalasi Python dan pip
echo "Memeriksa instalasi Python dan pip..."
python_version=$(python3 --version)
pip_version=$(pip3 --version)
echo "Python versi $python_version dan pip versi $pip_version telah terinstal."

echo "Auto-setup selesai."
