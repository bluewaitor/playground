#!/usr/bin/env bash

git log --since=am --pretty=tformat: --numstat | 
 awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "effected files: %s, added lines: %s, removed lines: %s, total lines: %s\n", NR, add, subs, loc }' -