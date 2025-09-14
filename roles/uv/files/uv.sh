# Usage: layout uv [python_version]
# Example: layout uv 3.13
# Default python_version is 3.13
layout_uv () {
    if [ ! command -v tomlq &> /dev/null ]; then
        log_error "tomlq is required for uv layout. Please install it first."
        return 1
    fi

    local PY_VERSION=${1:-3.13}
    local VIRTUAL_ENV="${2:-$(pwd)/.venv}"

    if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
        log_status "No virtual environment exists. Executing \`uv venv\` to create one."
        # if pyproject.toml exists, don't use the version provided by the user.
        if [ -f "pyproject.toml" ]; then
            PY_VERSION=$(tomlq -r '.project.["requires-python"]'  pyproject.toml) # | sed -E 's/[^0-9.]*([0-9.]+).*/\1/'
            log_status "pyproject.toml found. Using python version $PY_VERSION from pyproject.toml"
        fi
        uv venv --python "$PY_VERSION" "$(pwd)/.venv" --seed
    fi

    PATH_add "$VIRTUAL_ENV/bin"
    export UV_ACTIVE=1 
    export VENV_ACTIVE=1
    export VIRTUAL_ENV
    source "$VIRTUAL_ENV/bin/activate"
}
