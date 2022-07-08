#!/bin/bash
##brew install figlet
blue=$'\033[0;34m'
cyan=$'\033[1;96m'
reset=$'\033[0;39m'
green=$'\033[0;32m'
red=$'\033[0;31m'
yellow=$'\033[1;33m'

function delete() 
{
	read -n1 -p "${blue}Delete ${cyan}$1${blue} ? [y/${cyan}N${blue}]${reset} " input
	echo ""
	if [ -n "$input" ] && [ "$input" = "y" ]; then
		rm -rf $1
	fi
}

function print()
{
    maxspace=$(df -h | grep "/Users/$USER" | awk '{printf("%s", $2) }')
    currentspace=$(df -h | grep "/Users/$USER" | awk '{printf("%s", $3) }')
    spaceleft=$(df -h | grep "/Users/$USER" | awk '{printf("%s", $4) }')

    echo "${green}Spaceleft:${reset} ${red}$spaceleft"${reset}
    echo "${green}Current Space in Gb:${reset} ${red}$currentspace"${reset}
    echo "${green}Max Space In device:${reset} ${red}$maxspace"${reset}
}


print
echo "---------------------------------------"

rm -rf ~/.zcompdump* &>/dev/null
rm -rf ~/Library/*.42* &>/dev/null
rm -rf ~/*.42* &>/dev/null
rm -rf ~/.cocoapods* &>/dev/null
rm -rf ~/Library/Caches/* &>/dev/null
rm -rf ~/Library/Application\ Support/Caches/* &>/dev/null
delete "./Library/Containers/*"
delete "./Downloads/*"


read -n1 -p "${blue}Clean Homebrew? (${cyan}brew cleanup${blue}) [y/${cyan}N${blue}]${reset} " input
echo ""
if [ -n "$input" ] && [ "$input" = "y" ]; then
	brew cleanup ;:
fi

echo "---------------------------------------"
echo ${yellow}'Cleaned Using CcMaro'${reset}
echo
print
