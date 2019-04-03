#!bin/bash

username=

#Store list of existing users in a parameter
existing_users=$(awk -F: '{print $1}' /etc/passwd)

#Start: Execute revoke access if user exists
if grep -q "$username" <<< "${existing_users[@]}"; then
 userdel $username
 rm -rf /home/$username
else
 echo "User $username does not exist"
fi
#End: Execute revoke access if user exists
