#!bin/bash

username=
password=

#Store list of existing users in a parameter
existing_users=$(awk -F: '{print $1}' /etc/passwd)

#Start: Execute grant access if user is not present in the list of existing users
if grep -q "$username" <<< "${existing_users[@]}"; then
 echo "User already exists"
 exit 1
else
 echo "Adding new user: "$username
 encr=$(perl -e 'print crypt($ARGV[0], "password")' $password)
 useradd -m -p $encr $username
fi
#End: Execute grant access if user is not present in the list of existing users
