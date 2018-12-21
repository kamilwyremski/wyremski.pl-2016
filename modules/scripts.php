<?php

if(!isset($settings['base_url'])){
	die('Brak dostepu!');
}

$settings['active_menu'] = 'skrypty';

$scripts = get_scripts();

$render_variables = array_merge($render_variables, array('scripts' => $scripts));

$settings['logo_facebook'] = $settings['base_url'].'/'.$scripts[array_rand($scripts)]['image'];

if($lang=='en'){
	$settings['title'] = "Scripts of websites - ".$settings['title'];
	$settings['description'] = 'Scripts websites that I created. This is a quick and cheap way to build your own website!';
	$settings['og_url'] = 'scripts';
}else{
	$settings['title'] = "Skrypty stron internetowych - ".$settings['title'];
	$settings['description'] = 'Skrypty stron internetowych które stworzyłem. Dzięki nim w szybki i tani sposób możesz zbudować swoją własną stronę www!';
	$settings['og_url'] = 'skrypty';
}

$settings['link_alternate']['en'] = '/scripts';
$settings['link_alternate']['pl'] = '/skrypty';

