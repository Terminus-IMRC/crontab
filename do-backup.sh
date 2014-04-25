#!/bin/sh
PATH=/usr/bin:/bin:$PATH

cd $HOME/.crontab

if ! which crontab >/dev/null; then
	echo crontab: command not found >&2
	exit 1
fi

crontab -l >crontab.$USER
git add crontab.$USER
git commit crontab.$USER -m "[auto] update for user $USER" >/dev/null || true
