#!/usr/bin/env sh

use_precommit() {
    watch_file .pre-commit-config.yaml
    [ ! command -v pre-commit &> /dev/null ] && return 0

    pre-commit install
}
