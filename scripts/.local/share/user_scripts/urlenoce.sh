#!/usr/bin/bash
#
str=" sw hsdfsa sfsa"

function urlencode() {
	res=$(
		python <<EOF
import urllib.parse
print(urllib.parse.quote("$1"))
EOF
	)
	echo $res
}
echo $(urlencode "$str")
