#!/bin/bash
#Undercoverurl shortner
figlet Undercoverurl shortner
echo -n "Enter URL : "
read url
short_url=$(curl -s http://tinyurl.com/api-create.php?url=${url})
echo "from $url to : ${short_url}"
