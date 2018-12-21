<?php

header('Content-Type: text/html; charset=utf-8');

header('Expires: '.gmdate('D, d M Y H:i:s \G\M\T', time() + (60 * 60 * 24 * 365)));
header("Cache-Control: max-age");

ini_set("display_errors", "1");
error_reporting(E_ALL);
error_reporting(0);

require_once('vendor/autoload.php');
$loader = new Twig_Loader_Filesystem('views');
$twig = new Twig_Environment($loader, array(
    'cache' => 'tmp',
));

require_once('php/global.php');

$settings['base_url'] = 'http://localhost/wyremski.pl-2016';

if(isset($_GET['amp']) and $_GET['amp']){
	$settings['amp'] = true;
}else{
	$settings['amp'] = false;
}

if(isset($_GET['lang']) and $_GET['lang']=='en'){
	$lang = 'en';
	$lang_alternate = 'pl';
	$settings['title'] = 'Kamil Wyremski - Web Designer';
	$settings['keywords'] = 'web design, web pages, web developer, web scripts';
	$settings['logo_facebook'] = $settings['base_url'].'/upload/images/logo_facebook_en.png';
}else{
	$lang = 'pl';
	$lang_alternate = 'en';
	$settings['title'] = 'Kamil Wyremski - tworzenie stron www';
	$settings['keywords'] = 'skrypty stron www, tworzenie stron internetowych, programista, Full Stack Web Developer';
	$settings['logo_facebook'] = $settings['base_url'].'/upload/images/logo_facebook.png';
}
$settings['favicon'] = $settings['base_url'].'/upload/images/favicon/favicon.png';
$settings['link_alternate']['en'] = $settings['link_alternate']['pl'] = $settings['active_menu'] = $settings['og_url'] = '';

$module = 'index';
if(isset($_GET['module'])){
	switch($_GET['module']){
		case 'projects':
			$module = 'projects';
			break;
		case 'scripts':
			$module = 'scripts';
			break;
		case 'script':
			$module = 'script';
			break;
		case 'contact':
			$module = 'contact';
			break;
		case 'feed':
			$module = 'feed';
			break;
		default:
			$module = '404';
	}
}

$render_variables = array();

require_once('modules/'.$module.'.php');

$render_variables = array_merge($render_variables, array('settings' => $settings, 'lang' => $lang));

echo $twig->render($module.'.html', $render_variables);

 
