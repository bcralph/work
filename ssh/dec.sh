#!/bin/bash

askpwd(){
  echo "Please enter your password to decrypt id_rsa.enc/id_rsa.pub.enc..."
  read -s pwd
  echo "Key in again..."
  read -s pwd2
  echo $pwd $pwd2
  if [ "$pwd" != "$pwd2" ] ; then
    echo "Password not the same!!" ; 
    return 0;
  fi
  return 1;
}

askpwd
while [ $? -eq 0 ]
do
  echo Try again...
  askpwd
done

openssl enc -aes-256-cbc -a -d -pass pass:$pwd -in id_rsa.enc -out id_rsa.dec
openssl enc -aes-256-cbc -a -d -pass pass:$pwd -in id_rsa.pub.enc -out id_rsa.pub.dec

