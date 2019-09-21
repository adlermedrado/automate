#!/usr/bin/bash
for d in */; do
    echo $d
    rmdir --ignore-fail-on-non-empty "$d"
done
