#!/bin/bash

file="$1"
receiver="$2"

	awk -F " " '{print $7,$9}' "$file" | sort | uniq --count | tr -d '[[:blank:]]' > notification.txt;

	echo "Notification access log of Node Application" | mutt -s 'Notification' -a notification.txt -- "$receiver";

