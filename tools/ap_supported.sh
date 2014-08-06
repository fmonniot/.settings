if [[ ! $(iw list 2>&1 | grep -A6 "Supported interface modes" | grep AP$) ]]; then
	echo "Your wireless card does not support Access Point mode"
	exit 1
fi
