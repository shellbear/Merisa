Merisa
=

<img src="http://i.imgur.com/keNyJQX.png" width="135"> <img src="http://freevector.co/wp-content/uploads/2014/04/49703-dollar-money-sign-on-locked-padlock-security-symbol.png" width="180"> 


[![Version](https://img.shields.io/badge/MIRESA-1.0-brightgreen.svg?maxAge=259200)]()
[![Build](https://img.shields.io/badge/Supported_OS-macOS-orange.svg)]()
[![AUR](https://img.shields.io/aur/license/yaourt.svg)]()


Merisa is a complete ransomware script for MacOS. It list all files on the system, generate 2048 bits RSA keys sended by mail to encrypt all of them with aes-128 bits algorithm. After this, Miresa creates an Application on the desktop to view the procedure to get the key, and to decrypt files using the key.

If you want more informations about Merisa here the official page: (https://shellbear.github.io/Merisa.html)


Screenshots and Videos
=
Notice: These screenshots can be outdated ! 

Example of Merisa Webserver

![](https://media.giphy.com/media/l0Iyi42GzSIDmL1oA/giphy.gif)

Decryption Tool

![](http://i.imgur.com/pjMCjtf.png)

Example file of procedure to get the key

![](http://i.imgur.com/cE49sZM.png)

The mail received which contains the encryption key

<img src="http://i.imgur.com/krxLliV.jpg" width="270">


Legal Disclamer
=
    I don't hold any responsibility for the bad use of this tool,
    remember that attacking targets without prior consent is illegal and punished by law.


Credits
=
- shc : http://www.datsi.fi.upm.es/~frosal/


Configuration 
=
     In order to allow insecure send of mails you need to configure your Gmail account by visiting  
     this link : https://myaccount.google.com/lesssecureapps?rfn=27&rfnc=1&eid=-8528583655958181045&et=1&asae=2&pli=1


Known Issues
=

If you discover any bugs, feel free to create an issue on GitHub fork and
send us a pull request.


Author
=

* ShellBear (https://github.com/ShellBear)
* Blogspot (http://shellbearblog.blogspot.com)


Contributing
=

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
