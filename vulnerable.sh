#!/usr/bin/bash

#this program gives you different options to run a docker container like one for dvwa or webgoat
#reminder: don't forget to add Security Shepherd to the chooseable options
echo "[1] DVWA"
echo "[2] webgoat"
echo "[3] Juice Shop"
echo "[4] Security Shepherd"
echo "[0] cancel"
echo "[-1] close every site"
echo ""
read -p "[?]which one do you want: " INPUT

case $INPUT in
1) #DVWA
echo "[+]starting DVWA"
echo "[+]when the program is done go to http://127.0.0.1/dvwa"
sleep 2
docker run --rm -it -p 127.0.0.1:80:80 vulnerables/web-dvwa;;
2) #WebGoat
echo "[+]starting WebGoat"
echo "[+]when the program is done go to 127.0.0.1:8080/WebGoat"
sleep 2
docker run -it -p 127.0.0.1:8080:8080 -p 127.0.0.1:9090:9090 webgoat/webgoat;;
3) #juice shop
echo "[+]clearing port"
sleep 2
sudo pkill -f dockerd
echo "[+]starting Juice Shop"
echo "[+]when the program is done go to localhost:3000"
sleep 2
docker run -d -p 127.0.0.1:3000:3000 bkimminich/juice-shop;;
4) # security shepherd
echo "[+]comming soon";;
0) #closes the vulnerable.sh program
echo "[+]closing program";;
-1) #tries to kill all docker programs
sudo pkill -f dockerd
echo "[+]closing all sites"
sleep 1;;
*) # make this echo the options again
echo "[+]invalid input";;
esac
