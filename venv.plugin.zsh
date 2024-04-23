#!/bin/sh
autoload -U add-zsh-hook
# Run 'source venv/bin/activate' automatically every time there's
# a path "venv/bin/activate" file in the directory.
load-venv() {
  local v="venv/bin/activate"
  local venv_path="$(pwd)/$v"
    
  if [ -f "$venv_path" ]; then
    print "Sourcing: \"$v\""
    source "$venv_path"
  fi
}

# Function to deactivate the virtual environment
unload-venv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate
    source "$HOME/.zshrc"
  fi
}

# Hook functions to directory change events
add-zsh-hook chpwd unload-venv
add-zsh-hook chpwd load-venv

unload-venv
load-venv
