#!/usr/bin/env bash

# Need https://github.com/soimort/translate-shell installed.
# Need xsel or xclip installed.
# Need notify-send installed.
# Need python2 installed

se=$(xsel -b -n -o) # xclip -selection clipboard -o
se=$(python2 /path-to-CopyTrans/pre_text.py "$se")
re=$(trans -b en:zh "$se")  # the 'trans' command is the installed translate-shell.
notify-send "$se" "$re" -i accessories-dictionary -t 2000
