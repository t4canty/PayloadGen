#!/bin/sh
function pgfshell {
	clear
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
			printf "Enter a payload name:\n"
			while :
			do
				read -p "Payload>" payload
				if [ "$payload" = "back" ]; then
					clear
					break
				else
					echo "Fetching payload, please wait..."
					msfvenom -p $payload --list-options > less.txt 
					less less.txt
					rm less.txt
					echo "Enter Option 1 (Leave blank if none)"
					read -p "Payload>" opt1
					echo "Enter Option 2"
					read -p "Payload>" opt2
					echo "Enter Option 3"
					read -p "Payload>" opt3
					echo "Enter Option 4"
					read -p "Payload>" opt4
					echo "Enter Option 5"
					read -p "Payload>" opt5
					echo "Enter Encoder"
					read -p "Payload>" encoder
					echo "Enter Output File"
					read -p "Payload>" output
					msfvenom -p $payload $opt1 $opt2 $opt3 $opt4 $opt5 -f $encoder -o $output
					echo "Saved to $(pwd)/$output"
				fi
			done
		elif [ "$cmd" = "search" ]; then
			printf "Please select platform: \n 1) Linux \n 2) Windows \n 3) Other \n"
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
					clear
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
}
