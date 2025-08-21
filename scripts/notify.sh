#!/bin/bash

if [ $# -lt 1 ]; then
	echo "usage: notify.sh \"message\" \"title\""
	exit 1
fi

/usr/bin/osascript -e "display notification \"$1\" with title \"$2\""
