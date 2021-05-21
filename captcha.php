<?php
require ('vendor/autoload.php');
$request = json_decode(file_get_contents('php://input'),1);

if (isset($request['g-recaptcha-response'])) {
    $captcha_response = $request['g-recaptcha-response'];
} else {
    echo json_encode('Капча не найдена');
    exit();
}

$url = 'https://www.google.com/recaptcha/api/siteverify';
$params = [
    'secret' => '6LdXqqgaAAAAAC4_XnilvKiXI8fQau0nTal161Y5',
    'response' => $captcha_response,
    'remoteip' => $_SERVER['REMOTE_ADDR']
];

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

$response = curl_exec($ch);
if(!empty($response)) $decoded_response = json_decode($response);

$success = false;

if ($decoded_response && $decoded_response->success)
{
    $success = $decoded_response->success;
}

if ($success) {
    echo json_encode(1);
} else {
    echo json_encode(0);
}

