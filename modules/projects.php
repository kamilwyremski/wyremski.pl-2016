<?php

if(!isset($settings['base_url'])){
	die('Access denied!');
}

$settings['active_menu'] = 'projekty';

$projects = get_projects();

$render_variables = array_merge($render_variables, array('projects' => $projects));

$settings['logo_facebook'] = $settings['base_url'].'/'.$projects[array_rand($projects)]['image'];

if($lang=='en'){
	$settings['title'] = "My projects - my portfolio - ".$settings['title'];
	$settings['description'] = 'See my portfolio, pages and websites which I built. To all my projects I come with commitment and websites reflect a brand or product';
	$settings['og_url'] = 'projects';
}else{
	$settings['title']= "Projekty stron www - moje portfolio - ".$settings['title'];
	$settings['description'] = 'Zobacz moje portfolio, strony i serwisy internetowe które zbudowałem. Do wszystkich moich projektów podchodzę z zaangażowaniem a stworzone strony odźwierciedlają daną markę lub produkt';
	$settings['og_url'] = 'projekty';
}

$settings['link_alternate']['en'] = '/projects';
$settings['link_alternate']['pl'] = '/projekty';
