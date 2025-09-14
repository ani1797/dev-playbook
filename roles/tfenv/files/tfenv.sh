# Usage: use tfenv [terraform_version]
# Example: use tfenv 1.0.0

use_tfenv () {
    local TFENV_TERRAFORM_VERSION=${1:-}
    if [[ -z $TFENV_TERRAFORM_VERSION ]]; then
        if [[ -f .terraform-version ]]; then
            TFENV_TERRAFORM_VERSION=$(cat .terraform-version)
        else
            TFENV_TERRAFORM_VERSION=$(tfenv list-remote | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | head -n 1)
            log_status "No terraform version specified and .terraform-version file not found. Using latest version: $TFENV_TERRAFORM_VERSION"
        fi
    fi
    export TFENV_AUTO_INSTALL="true"
    export TFENV_TERRAFORM_VERSION
    tfenv use "$TFENV_TERRAFORM_VERSION"
}
