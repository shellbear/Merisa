<?php
foreach ($_GET as $key => $value) {
shell_exec("bash add.sh $value &");
}
header("location:javascript://history.go(-1)");
?>