#!/usr/bin/env bash

FILES=$(find ./ -type f -name "*.py")
size=$1

if [ $# -eq 1 ]; then
  for file in $FILES; do
    if [ -f "$file" ]; then
      name="$(basename "${file}" .py)"
      target=$(printf "%0${size}d" "$((10#$name))")
      mv "$file" "${target}.py"
    fi
  done
else
  echo Usage: ./fillZero.sh 数字[文件名长度]
  exit 1
fi
