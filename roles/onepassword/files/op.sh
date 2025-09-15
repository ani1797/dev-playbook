#!/usr/bin/env sh

use_oprc() {
    [[ -f .oprc ]] || return 0
    if ! op whoami > /dev/null 2>&1; then
        # Sign in to 1Password if not already signed in
        eval $(op signin -f)
    fi
    direnv_load op run --env-file .oprc --no-masking -- direnv dump
    watch_file .oprc
}
