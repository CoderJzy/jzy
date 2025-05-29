#!/bin/bash

if [ -d "/data/jzy/fastllm" ]; then
    cd /data/jzy/fastllm
elif [ -d "/root/fastllm" ]; then
    cd /root/fastllm
fi

username="CoderJzy"
password=""

expect << EOF
    set env(https_proxy) "192.168.1.170:10809"
    
    spawn git add . 
    expect eof
    
    spawn git commit -m update
    expect eof
    
    spawn git push
    
    expect "Username for 'https://github.com':"
    send "$username\r"
    
    expect "Password for 'https://$username@github.com':"
    send "$password\r"
    
    expect eof
EOF
