#!/bin/bash

nmcli dev wifi

printf "Network Name: "
read network_name
printf "Network Password: "
read network_password

nmcli device wifi connect $network_name $network_password
