#!/bin/sh
PATH=/usr/bin:/bin:$PATH

cd $HOME/.crontab

if ! which crontab >/dev/null; then
	echo crontab: command not found >&2
	exit 1
fi

HOST=$(hostname)
FILE="crontab.$HOST.$USER"

crontab -l >"$FILE"
git add "$FILE"
git commit "$FILE" -m "[auto] update for user $USER at $HOST" >/dev/null || true
