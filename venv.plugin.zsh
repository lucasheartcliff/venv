#!/bin/sh
autoload -U add-zsh-hook
# Run 'source venv/bin/activate' automatically every time there's
# a path "venv/bin/activate" file in the directory.
load-venv() {
  local venv_path="$(pwd)/venv/bin/activate"

  if [ -f "$venv_path" ]; then
    source $venv_path
  fi
}
add-zsh-hook chpwd load-nvmrc
load-venv
