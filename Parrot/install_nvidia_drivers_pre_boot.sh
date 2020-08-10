#!/bin/bash

#blacklist the Nouveau driver
sudo cat >> /etc/modprobe.d/blacklist-nouveau.conf <<EOL
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off 
alias lbm-nouveau off
EOL


echo "Do you want to reboot now ?"
read inputs
if [$inputs == "Y" || $inputs == "y"]; then
	reboot
fi
