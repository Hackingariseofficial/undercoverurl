#!/data/data/com.termux/files/usr/bin/bash
# Author: laughingman 
# Hackingarise
# hackingarise.com
#!/bin/bash
#Undercoverurl shortner
figlet Undercoverurl shortner termux
echo -n "Enter URL : "
read url
short_url=$(curl -s http://tinyurl.com/api-create.php?url=${url})
echo "from $url to : ${short_url}"
