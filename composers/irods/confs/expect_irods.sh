#!/usr/bin/expect
eval sudo /var/lib/irods/packaging/setup_irods.sh
expect ":"
send "icatserver\r"
expect ":"
send "\r"
wait