# Clipboard Management

paste() {
    local paste_cmd
    local paste_args=()
    if command -v xclip &>/dev/null; then
        paste_cmd="xclip"
        paste_args=("-selection" "clipboard" "-o")
    elif command -v xsel &>/dev/null; then
        paste_cmd="xsel"
        paste_args=("--clipboard" "--output")
    elif command -v wl-paste &>/dev/null; then
        paste_cmd="wl-paste"
    elif command -v pbpaste &>/dev/null; then
        paste_cmd="pbpaste"
    else
        echo "No clipboard utility found. Please install xclip, xsel, wl-clipboard, or pbcopy."
        return 1
    fi

    "$paste_cmd" "${paste_args[@]}"
}

copy() {
    local clip_cmd
    local clip_args=()
    if command -v xclip &>/dev/null; then
        clip_cmd="xclip"
        clip_args=("-selection" "clipboard")
    elif command -v xsel &>/dev/null; then
        clip_cmd="xsel"
        clip_args=("--clipboard" "--input")
    elif command -v wl-copy &>/dev/null; then
        clip_cmd="wl-copy"
    elif command -v pbcopy &>/dev/null; then
        clip_cmd="pbcopy"
    else
        echo "No clipboard utility found. Please install xclip, xsel, wl-clipboard, or pbcopy."
        return 1
    fi

    if [ -t 0 ]; then
        echo -n "$1" | "$clip_cmd" "${clip_args[@]}"
    else
        "$clip_cmd" "${clip_args[@]}"
    fi
}

has() {
    command -v "$1" &>/dev/null
    return $?
}

# System Aliases
alias ll='ls -alF'
alias la='ls -A'
alias c='clear'
alias e='exit'
alias h='history'
alias j='jobs -l'
alias r='source ~/.zshrc'
alias s='sudo'
alias mkdir='mkdir -pv'

if has "git"; then
    alias g='git'
fi
