<?php

if(!isset($settings['base_url'])){
	die('Access denied!');
}

header('HTTP/1.0 404 Not Found');

$module = '404';

if($lang=='en'){
	$settings['title'] = "Error 404 - ".$settings['title'];
	$settings['description'] = "Error 404 - The page you are looking for has been moved, deleted, or simply never existed.";
}else{
	$settings['title'] = "Błąd 404 - ".$settings['title'];
	$settings['description'] = "Błąd 404 - Strona którą szukasz została przesunięta, usunięta albo po prostu nigdy nie istniała.";
}