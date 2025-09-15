#!/usr/bin/env bash

set -euo pipefail

detect_os() {
    if [ -f /etc/os-release ]; then
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
            sudo apt install -y ansible ansible-lint
        elif [[ "$OS" == "darwin" ]]; then
            if ! command -v brew &> /dev/null; then
                echo "Homebrew not found. Installing Homebrew first..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install ansible ansible-lint
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
ansible-playbook playbook.yml 
