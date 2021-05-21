<?php
require ('vendor/autoload.php');

// подтверждение email

$hash = $_GET['hash'];

if (!$_GET['hash']) {
    echo "Хэш не получен";
    exit();
}

$hashResult = \Jumpers\Reg::confirmEmail($hash);
if ($hashResult) {
    try {
        \Jumpers\Reg::setEmailConfirmed($hash);
        header("location:confirm.html");
    }
    catch (Exception $e) {
        echo $e->getMessage();
    }
} else {
    echo "Хэш не найден";
}
