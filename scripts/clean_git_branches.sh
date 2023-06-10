#!/usr/bin/env bash

function remove_deleted_git_branches_all_dirs {
  for subdir in "$1"/*; do
    echo "$subdir"
    if [ -d "$subdir" ]; then
      cd "$subdir" || exit
      remove_local_git_branches_deleted_on_remote
    fi
  done
}

function remove_local_git_branches_deleted_on_remote {
  git fetch -p
  git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}