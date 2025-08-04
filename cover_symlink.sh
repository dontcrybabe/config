#!/bin/bash
repo_dir="."
for link in $(find "$repo_dir" -type l); do
    target=$(readlink -f "$link")
    dest="$link"  # Modify this if you want a different destination name
    echo "Processing link: $link"
    echo "Target: $target"
    echo "Destination: $dest"
    if [[ -f "$target" && "$target" != "$(realpath "$dest")" ]]; then
        cp -v "$target" "$dest"
        git add "$dest"
    else
        echo "Skipping $link: Same file or invalid target"
    fi
done
