#!/usr/bin/env zsh

# Enabling ssh agent for zsh sessions
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    clear
fi