#!/usr/bin/env bash

# Need https://github.com/soimort/translate-shell installed.
# Need xsel or xclip installed.
# Need notify-send or libnotify-bin installed.

curdir=`dirname $0`

selected=`xsel -b -n -o` # xclip -selection clipboard -o
selected=`printf "$selected" | tr -d '\r' | sed 's/-$//g' | tr -d '\n'`
translated=`${curdir}/trans -e bing -b en:zh "$selected"`  # the 'trans' command is the installed translate-shell.
notify-send "$selected" "$translated" -t 2000
