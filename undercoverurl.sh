#!/bin/bash
# Author: laughingman 
# Hackingarise
# hackingarise.com

trap 'printf "\n";partial;exit 1' 2 

banner() {
figlet -kf banner Undercover Url

printf "\e[1;77m CODING BY LAUGHING MAN \e[0m\n"
printf "\e[1;77m for  \e[0m\n"
printf "\e[1;77m hackingarise \e[0m\n"
printf "\e[1;77m This script is use to to hide your phishy yours what the script is done it will gave you a list pick the url u wanna use and paste it in to undercovershortner for a short url  \e[0m\n"
printf "\n"

}

partial() {

if [[ -e $url.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.txt\n" $url
fi


}

scanner() {

read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Input Something post E.G cova19-cure-not what-you-think ending with @:\e[0m ' post

read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Input Url you wanna hide with out http or https :\e[0m ' url


if [[ -e $url.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Removing previous file:\e[0m\e[1;77m %s.txt" $url
rm -rf $url.txt
fi
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking for urls\e[0m\e[1;77m %s\e[0m\e[1;92m on: internet  \e[0m\n" 

##Google
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Send this link : \e[0m"
check1=$(curl -s -i "https://www.google.com-$post$url" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m %s\n" $url
printf "https://www.google.com-$post$url" $url >> $url.txt
fi

## INSTAGRAM

check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com-$post$url" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_insta == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.instagram.com-$post%s\n" $url
printf "https://www.instagram.com-$post%s\n"$url > $url.txt
elif [[ $check_insta == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## Facebook

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Facebook: \e[0m"
check_face=$(curl -s "https://www.facebook.com-$post$url" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)


if [[ $check_face == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.facebook.com-$post%s\n" $url
printf "https://www.facebook.com/%s\n" $url >> $url.txt
elif [[ $check_face == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## TWITTER 

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check_twitter=$(curl -s "https://www.twitter.com-$post$url" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_twitter == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.twitter.com-$post/%s\n" $url
printf "https://www.twitter.com-$post%s\n" $url >> $url.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## YOUTUBE

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check_youtube=$(curl -s "https://www.youtube.com-$post$url" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)


if [[ $check_youtube == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.youtube.com-$post/%s\n" $url
printf "https://www.youtube.com-$post%s\n" $url >> $url.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## BLOGGER

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blogger: \e[0m"
check=$(curl -s "https://topnews.blogspot.com-$post$url" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)


if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://topnews.blogspot.com-$post%s\n" $url
printf "https://topnews.blogspot.com-$post/%s\n" $url >> $url.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi



partial
}
banner
scanner





