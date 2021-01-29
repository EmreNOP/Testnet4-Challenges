#!/bin/bash
#Discord = depasty#7902

#You need to add below to crontab. after 7 days delete from cron
#38 12 * * * /home/testnet/Documents/concordium-software/T4.sh


#Below should be address not account name !!
receiver="4r3kjdshlakjsdhlkjashdlkjaslhkjdhlsakjdhlkasjhldkj"
#Below should be address not account name !!
sender="4ehasdkjşlaskjoıwqueowqıueoıwqueoıwquoıuewoueuweue"
pass="123456\n"

cd /home/testnet/Documents/concordium-software

myDateString=`date -d '1 mins' +%Y-%m-%dT%H:%M:%SZ`

echo "RUN $myDateString"
/usr/bin/expect << EOF  >> T4.log
set timeout -1
spawn ./concordium-client transaction send-gtu-scheduled --schedule "50 at $myDateString" --receiver "$receiver" --sender "$sender" --no-confirm

expect "Enter password for signing key:"
send -- $pass
expect eof

EOF
