#!/usr/bin/env bash


echo -n "Enter git Username: "
read -r  uname
git config --global user.name $uname

echo -n "Enter git email: "
read -r  uemail
git config --global user.name $uemail

echo -n "[+] Setting up Environment"

echo -n "Do you want to setup gpg key ? [y/n]: "
read -r -n1 input
if [[ "$input" =~ ^[Yy]$ ]]; then
	git config --global commit.gpgsign true
	
	echo -n "Do ypu want to Generate GPG key ? [y/n]"
	read -r -n1 input
	if [[ "$input" =~ ^[Yy]$ ]]; then
		gpg --full-generate-key
		gpg --list-secret-keys --keyid-format LONG
	fi
	
	echo -n "Do you have GPG key ? [y/n]: "
	read -r -n1 input
	if [[ "$input" =~ ^[Yy]$ ]]; then
		gpg --list-secret-keys --keyid-format LONG
		
		echo -n "Enter above GPG key ID:"
		read -r  ugpgkey
		git config --global user.signingkey $ugpgkey
		
		echo -n "Add below secret key to your github account."
		gpg --export --armor
	fi
	
	echo 'export GPG_TTY=$(tty)' >> ~/.profile
	
fi


