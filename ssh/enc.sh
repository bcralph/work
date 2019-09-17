#!/bin/bash

askpwd(){
  echo "Please enter your password to encrypt id_rsa/id_rsa.pub..."
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

openssl enc -aes-256-cbc -a -pass pass:$pwd -in id_rsa -out id_rsa.enc
openssl enc -aes-256-cbc -a -pass pass:$pwd -in id_rsa.pub -out id_rsa.pub.enc

