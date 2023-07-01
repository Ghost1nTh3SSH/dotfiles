#!/bin/sh

file="./target"


if [ -s $file ]; then
    echo "$(head -n 1 $file)"
else
    echo "No target"
fi
