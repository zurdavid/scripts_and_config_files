#!/usr/bin/bash

# search in pwd and parent directories for a venv and activate it
pyenv(){
  goback="../"
  dir=""

  for i in 1 2 3 4 5; do
    find="$(ls -l $dir | grep venv)"
    if [ -n "$find" ]; then
      # echo "venv found"
      source "$(echo $dir)venv/bin/activate"
      break
    else
      # echo "venv not found"
      dir="$goback$dir"
      fi
  done
}

