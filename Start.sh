echo  "Select the action that you would like to perform. Type g for granting access and r for revoking access to the user:"
read action
echo "Enter a username for grant/revoke:"
read username
echo "Enter a password for grant/revoke:"
read -s password

#Store Hostnames and Usernames in an array
hosts=$(cat hosts.txt)

#Start: Loop through the array to execute the grantaccess or revoke access script
 for item in ${hosts[@]}; do
  #Seperate hostnames and admin users using comma and store them in parametres
  hostname=$(echo $item | awk -F ',' '{print $1}')
  admin_user=$(echo $item | awk -F ',' '{print $2}')
  echo "Enter the password for $admin_user in $hostname server:"
  read -s admin_password
  
  #Start: Execute if condition based on action selected
  if [[ $action == 'g' ]]; then
   sshpass -p $admin_password scp -o StrictHostKeyChecking=no grantaccess.sh $admin_user@$hostname:/home/$admin_user
   sshpass -p $admin_password ssh -o StrictHostKeyChecking=no -t $admin_user@$hostname "cd /home/$admin_user && sed -i -e 's/username=/username=$username/g' grantaccess.sh && sed -i -e 's/password=/password=$password/g' grantaccess.sh && sudo sh grantaccess.sh && sudo rm grantaccess.sh"
  elif [[ $action == 'r' ]]; then
   sshpass -p $admin_password scp -o StrictHostKeyChecking=no revokeaccess.sh $admin_user@$hostname:/home/$admin_user
   sshpass -p $admin_password ssh -o StrictHostKeyChecking=no -t $admin_user@$hostname "cd /home/$admin_user && sed -i -e 's/username=/username=$username/g' revokeaccess.sh && sudo sh revokeaccess.sh && sudo rm revokeaccess.sh"
  else
   echo 'Invalid option selected for action.'
   exit 2
  fi
  #End: Execute if condition based on action selected
 done
#End: Loop through the array to execute the grantaccess or revoke access script

