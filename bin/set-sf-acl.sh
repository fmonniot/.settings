#!/bin/sh
###
## Automatic settings ACL for Symfony2
## by F. Monniot (github.com/francoismonniot/sf-acl
###


## Define some default variable
txtred='\e[0;31m'
txtgrn='\e[0;32m'
txtylw='\e[0;33m'
txtcyn='\e[0;36m'
txtrst='\e[0m'

dftusr=francois
httpUser=http

## If no parameter display help
if [ $# -eq 0 -o $# -gt 2 ];then
  echo "Usage: ./set-acl.sh target_folder user_granted"
  exit;
fi

## Verify target folder
if  [ -d $1 ];then
  FOLDER=$1
  echo -e $txtgrn"Target folder [exist]"$txtrst":\t\t" $FOLDER
else
  echo -e $txtred"Target folder doesn't exist"$txtrst":\tOperation Aborted."
  exit;
fi

## Define USER if $2 not empty
if [ ! -z "${2+xxx}" ]; then
  USER=$2
else
  USER=auserthatcannotexist #Hack for egrep that return true if USER is empty
fi

## Verify user
egrep -i "^${USER}" /etc/passwd > /dev/null
if [ $? -eq 0 ]; then
  echo -e $txtgrn"User [exist]"$txtrst":\t\t\t" $USER
else
  USER=$dftusr
  echo -e $txtred"User doesn't exist"$txtrst": fallback to\t"$txtylw $USER $txtrst
fi


# Creates ACL
echo -e $txtcyn"Granting user right (rwx) via ACL"$txtrst
echo "setfacl -R -m \"u:${USER}:rwx\" -m \"u:${httpUser}:rwx\" ${FOLDER}"
sudo setfacl -R -m "u:${USER}:rwx" -m "u:${httpUser}:rwx" $FOLDER

echo "setfacl -Rd -m \"u:${USER}:rwx\" -m \"u:${httpUser}:rwx\" ${FOLDER}"
sudo setfacl -Rd -m "u:${USER}:rwx" -m "u:${httpUser}:rwx" $FOLDER

echo -e $txtcyn"Displaying ACL for confirmation (path: ${FOLDER}):"$txtrst
#getfacl $FOLDER | grep "${USER}\|http"
getfacl $FOLDER
