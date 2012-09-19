SERVER_ADDRESS=157.159.43.92
SERVER_USERNAME=fmserver
SERVER_PORT=50022

if [ "$(id -u)" == "0" ]; then
        sudo sshfs $SERVER_USERNAME@$SERVER_ADDRESS:/home/samba/ /mnt/fmserver -p$SERVER_PORT
	kdesu dolphin /mnt/fmserver & 2>/dev/null
else
	echo "You have to be root !"
fi
