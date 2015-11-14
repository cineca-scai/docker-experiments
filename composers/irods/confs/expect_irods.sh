#!/usr/bin/expect -f

## WARNING: does not work yet

if {[llength $argv] != 2} {
    puts "usage: EXPECTSCRIPT password dbhost "
    exit 1
}

set password [lrange $argv 0 0]
set mydb [lrange $argv 1 1]
set timeout 2

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
expect "tempZone?:*"
send -- "\r"
# port
expect ":*"
send -- "\r"
# range begin
expect ":*"
send -- "\r"
# range end
expect ":*"
send -- "\r"
# vault
expect ":*"
send -- "\r"
# zone key
expect ":*"
send -- "\r"
# negotation key
expect ":*"
send -- "\r"
# control plane port
expect ":*"
send -- "\r"
# control plane key
expect ":*"
send -- "\r"
# schema
expect "configuration?:*"
send -- "\r"
# account username
expect ":*"
send -- "\r"
# account password
expect "password:*"
send "$password\r"
# Last confirmation
expect "settings..yes.:"
send "yes\r"

##############################
# DB accounting

# server host name
expect "or.IP.address:*"
send -- "$mydb\r"
# db port
expect ".:*"
send -- "\r"
# database name
expect "ICAT.:*"
send -- "\r"
# database username
expect "irods.:*"
send -- "\r"
# database password
expect "password:*"
send "$password\r"
# Last confirmation
expect "settings..yes.:"
send "yes\r"

expect eof