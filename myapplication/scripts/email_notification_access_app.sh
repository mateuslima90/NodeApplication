#!/bin/bash

file="$1"
receiver="$2"

	awk -F " " '{print $7,$9}' "$file" | sort | uniq --count | tr -d '[[:blank:]]' > /home/makingthehand/myapplication/scripts/notification.txt;

	echo "Notification access log of Node Application" | mutt -s 'Notification' -a /home/makingthehand/myapplication/scripts/notification.txt -- "$receiver";

