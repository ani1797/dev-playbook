#!/usr/bin/env bash

set -euo pipefail

detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="darwin"
        VERSION_ID=$(sw_vers -productVersion)
    elif [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
        VERSION_ID=$VERSION_ID
    else
        echo "Cannot detect operating system."
        exit 1
    fi
}

install_ansible() {
    detect_os
    if ! command -v ansible &> /dev/null; then
        echo "Ansible not found, installing..."
        if [[ "$OS" == "ubuntu" ]]; then
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y software-properties-common
            sudo add-apt-repository --yes --update ppa:ansible/ansible
            sudo apt install -y ansible
        elif [[ "$OS" == "darwin" ]]; then
            if ! command -v brew &> /dev/null; then
                echo "Homebrew not found. Installing Homebrew first..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install ansible
        elif [[ "$OS" == "rocky" || "$OS" == "almalinux" ]]; then
            sudo dnf install -y epel-release
            sudo dnf install -y ansible
        elif [[ "$OS" == "centos" || "$OS" == "rhel" || "$OS" == "fedora" ]]; then
            sudo yum install -y ansible
        elif [[ "$OS" == "arch" || "$OS" == "manjaro" ]]; then
            sudo pacman -Syu --noconfirm
            sudo pacman -S --noconfirm ansible
        elif [[ "$OS" == "alpine" ]]; then
            sudo apk update
            sudo apk add ansible
        else
            echo "Unsupported OS: $OS"
            exit 1
        fi
        if ansible --version &> /tmp/ansible_version; then
            echo "Ansible installed successfully. Version info: $(cat /tmp/ansible_version)"
        else
            echo "Failed to install Ansible."
            exit 1
        fi
    else
        echo "Ansible is already installed."
    fi
}

install_ansible
ansible-playbook -u $USER -i inventory.yml -l localhost playbook.yml 
