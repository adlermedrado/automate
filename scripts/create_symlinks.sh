#!/usr/bin/env bash

source_path="$HOME/code/dot-files/"
dest_path="$HOME/"

links=(
  "${source_path}zsh/.zshrc ${dest_path}.zshrc"
  "${source_path}zsh/.zprofile ${dest_path}.zprofile"
  "${source_path}tmux/.tmux.conf ${dest_path}.tmux.conf"
  "${source_path}starship/starship.conf ${dest_path}.config/starship.conf"
)

for pair in "${links[@]}"; do
  set -- $pair
  source=$1
  target=$2
  echo "Creating symlink: $source -> $target"
  ln -v -s "$source" "$target"
done
