#!/usr/bin/env bash

# Need https://github.com/soimort/translate-shell installed.
# Need xsel or xclip installed.
# Need notify-send installed.

se=$(xsel -b -n -o | tr '\n' ' '| tr '\r' ' ' | sed 's/  / /g') # xclip -selection clipboard -o
echo $se
re=$(trans -b en:zh "$se")  # the 'trans' command is the installed translate-shell.
echo $re
notify-send "$se" "$re" -i accessories-dictionary -t 2000
