#!/bin/bash

while :
do
	read -p "PGF>" cmd
	if [ "$cmd" = "help" ]; then
		echo "'gen' Generate a payload"
		echo "'help' Print this help"
		echo "'search' Search for payloads"
		echo "'listen' Start a netcat listener"
		echo "'exit' Takes you to a magical land called 'outside'"
	elif [ "$cmd" = "gen" ]; then
		echo "Sorry, not implemented yet."
	elif [ "$cmd" = "search" ]; then
		echo "Please select platform: \n 1) Linux \n 2) Windows \n 3) Other "
		while :
		do
			read -p "Platform>" plat
			if [ "$plat" = "windows" ] || [ "$plat" = "2" ]; then
				echo "Fetching Payloads, please be patient..." && msfvenom -l payloads | grep windows  > less.txt; less less.txt
				rm less.txt
			elif [ "$plat" = "linux" ] || [ "$plat" = "1" ]; then
				echo "Fetching Payloads, please be patient..." && msfvenom -l payloads | grep linux  > less.txt; less less.txt
				rm less.txt
			elif [ "$plat" = "other" ] || [ "$plat" = "3" ]; then
				echo "Fetching Payloads, please be patient..." && msfvenom -l payloads | grep -v linux | grep -v windows  > less.txt; less less.txt
				rm less.txt
			elif [ "$plat" = "back" ]; then
				break
			else
				echo "Sorry, didn't quite get that. Please use 'back' to return, or type a platform. "
			fi
		done
	elif [ "$cmd" = "listen" ]; then
		read -p "Enter port to listen on:" port
		nc -lvp $port
	elif [ "$cmd" = "bunny" ]; then
		printf "\n/)___(\ \n(='.'=)\n(\")_(\")\n"
	elif [ "$cmd" = "exit" ]; then
		echo "Bye!"
		exit 0
	else
		echo "Sorry, didn't quite get that. type 'help' for more options."
	fi
done
