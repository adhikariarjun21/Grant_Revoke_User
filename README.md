# Grant_Revoke_User

Steps to grant or revoke access to a user
1. Copy the grantaccess.sh, revokeaccess.sh, hosts.txt and Start.sh files to a linux machine. All the files need to be in the same path.
2. Edit the hosts.txt file and enter the list of hosts and admin users for each of the machines.
Example
52.18.26.11,localadmin
52.19.18.78,localadmin
3. Run the following command - sh Start.sh
4. Enter g or r based on the Action that you would like to perform.
5. Enter a username and password for the user that you would like to grant/revoke access when prompted.
6. The Admin password for each VM is asked for security. Enter the password for the corresponding combination of hostnames and Admin users.
Example:
Select the action that you would like to perform. Type g for granting access and r for revoking access to the user:
g
Enter a username for grant/revoke:
tom
Enter a password for grant/revoke:
password
Enter the password for localadmin in 52.18.26.11 server:
adminpassword
