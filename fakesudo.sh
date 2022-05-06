#!/bin/bash

if [[ -f "key.txt" ]] ; then
	key="$(cat "key.txt")"
	read -p "Enter the password:> " inp
	if [[ "$(echo "${inp}" | sha256sum | awk '{print $1}')" = "${key}" ]] ; then
		mplayer stdin.mp3 &> /dev/null
		fish
	else
		mplayer stderr.mp3 &> /dev/null
		exit 1
	fi
else
	read -p "Key file not found please type any password:> " key
	echo "${key}" | sha256sum | awk '{print $1}' > key.txt
fi
