#!/bin/sh
PATH=/usr/bin:/bin:$PATH

crontab -l >crontab.$USER
git add crontab.$USER
git commit crontab.$USER -m "update for user $USER" >/dev/null || true
