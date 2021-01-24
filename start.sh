#!/bin/bash

function validator {
    aux=$(echo $1 | sed 's/[0-9]//g')
    if [ "$0" != ""  ] && [ "$aux" = "" ]; then
        echo $1
    else
        echo $2
    fi
}

if [ "$PASS_ROOT" != "" ]; then
    echo 'root:'$PASS_ROOT | chpasswd
fi

if [ "$PASS_USER" != "" ]; then
    echo 'flask:'$PASS_USER | chpasswd
fi

cd /home/flask
port=$(validator $PORT "80")
num_process=$(validator $NUM_PROCESS "4")
gunicorn --reload -w $num_process -b :$port "app:app" &

/usr/sbin/sshd -Def /etc/ssh/sshd_config

