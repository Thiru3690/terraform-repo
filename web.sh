#!/bin/bash
sudo dnf install wget unzip httpd -y
systemctl enable httpd
systemctl start httpd
wget https://www.tooplate.com/zip-templates/2131_wedding_lite.zip
unzip -o 2131_wedding_lite.zip
cp -r 2131_wedding_lite/* /var/www/html/
sudo systemctl restart httpd
