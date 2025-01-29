#!/bin/bash
echo '----- HTB AUTOSCAN SCRIPT -----' # TODO: Make more appealing header

echo -n ' Enter Machine IP: '
read ip

echo ' [+] Performing nmap scan...'
nmap -sC -A -p- --min-rate=1000 $ip # TODO: Filter output

echo -n ' [?] View webpage? [y/n] '
read webpage_bool

if [ "$webpage_bool" = "y" ]; then
	echo -n ' [?] What port for web server? (default 80) '
	read web_port

	if [ "$web_port" = "" ]; then
		$web_port = 80
	fi

	firefox $ip:$web_port # TODO: Run headless
fi