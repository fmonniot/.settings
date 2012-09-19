echo "Sound cards recognized by the system:"; 
lspci -nn | grep --color=none '\[04[80][13]\]'; 
echo "Sound cards recognized by ALSA:"; 
lspci -nn | grep '\[04[80][13]\]' | while read line; 
	do lspci -nnk | grep -A 3 '\[04[80][13]\]' | grep -e 'Kernel modules: ..*' -e '\[04[80][13]\]' | grep --color=none -F "$line"; 
done; 
echo "Sound cards recognized by ALSA, and activated:"; 

lspci -nn | grep '\[04[80][13]\]' | while read line; do lspci -nnk | grep -A 3 '\[04[80][13]\]' | grep -e 'Kernel drivers in use: ..*' -e '\[04[80][13]\]' | grep --color=none -F "$line"; done
