#!/usr/bin/expect

set username "CoderJzy"
set password "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"
set env(https_proxy) "192.168.1.170:10809"

cd /data/jzy/fastllm

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
