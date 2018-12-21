<?php

if(!isset($settings['base_url'])){
	die('Access denied!');
}

$render_variables = array_merge($render_variables, array('projects' => get_projects(4), 'scripts' => get_scripts(3)));

$settings['active_menu'] = 'index';

if($lang=='en'){
	$settings['description'] = 'Creating a modern, in accordance with SEO, responsive websites';
}else{
	$settings['description'] = 'Tworzenie nowoczesnych, zgodnych z SEO, bezpiecznych oraz responsywnych stron internetowych. Gotowe skrypty stron www.';
}