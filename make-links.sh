#!/bin/sh
set -eux

GC="$HOME/.gitconfig"
THISDIR="$(cd "$(dirname "$0")" && pwd)"

if [ -f "$GC" ]; then
    echo "$GC already exists"
    exit 1
fi

ln -s "$THISDIR/.gitconfig" "$GC"

