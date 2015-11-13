#!/usr/bin/expect -f

if {[llength $argv] != 2} {
    puts "usage: EXPECTSCRIPT password dbhost "
    exit 1
}

set password [lrange $argv 0 0]
set mydb [lrange $argv 1 1]
set timeout 5

spawn sudo /var/lib/irods/packaging/setup_irods.sh
match_max 100000

# SUDO REQUEST
expect "*assword for irods:*"
send -- "$password\r"

##############################
# IRODS in itself

# account
expect ":*"
send -- "\r"
# group
expect ":*"
send -- "\r"
# zone
expect ":*"
send "\r"
# port
expect ":*"
send "\r"
# range begin
expect ":*"
send "\r"
# range end
expect ":*"
send "\r"
# vault
expect ":*"
send "\r"
# zone key
expect ":*"
send "\r"
# negotation key
expect ":*"
send "\r"
# control plane port
expect ":*"
send "\r"
# control plane key
expect ":*"
send "\r"
# schema
expect ":*"
send "\r"
# account password
expect ":*"
send "$password\r"
# Last confirmation
expect ":*"
send "yes\r"

##############################
# DB accounting

# server host name
expect ":*"
send -- "$mydb\r"
# db port
expect ":*"
send "\r"
# database name
expect ":*"
send "\r"
# database username
expect ":*"
send "\r"
# database password
expect ":*"
send "$password\r"
# Last confirmation
expect ":*"
send "yes\r"

expect eof