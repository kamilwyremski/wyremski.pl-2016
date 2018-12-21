<?php

if(!isset($settings['base_url'])){
	die('Access denied!');
}

header("Content-Type: application/xml; charset=utf-8");

$lang = 'pl';
$lang_alternate = 'en';

$scripts = get_scripts();

usort($scripts, function($a, $b) {
    return strtotime($b['date_update']) - strtotime($a['date_update']);
});

$rssfeed = '<?xml version="1.0" encoding="utf-8"?>';
$rssfeed .= '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">';
$rssfeed .= '<channel>';
$rssfeed .= '<title>Skrypty stron www - Kamil Wyremski - kanał RSS</title>';
$rssfeed .= '<link>https://wyremski.pl</link>';
$rssfeed .= ' <image>
	<title>Kamil Wyremski</title>
	<url>https://wyremski.pl/upload/images/logo_facebook.png</url>
	<link>https://wyremski.pl</link>
</image>';

$rssfeed .= '<description>Tworzenie nowoczesnych, zgodnych z SEO, bezpiecznych oraz responsywnych stron internetowych. Gotowe skrypty stron www.</description>';
$rssfeed .= '<language>pl</language>';
$rssfeed .= '<lastBuildDate>'.date("D, d M Y H:i:s O").'</lastBuildDate>';
$rssfeed .= '<atom:link href="https://wyremski.pl/php/rss.php" rel="self" type="application/rss+xml" />';


foreach($scripts as $script){
	$rssfeed .= '<item>';
	$rssfeed .= '<title>'.$script['name'].'</title>';
	$rssfeed .= '<link>https://wyremski.pl/skrypt/'.$script['url'].'</link>';
	$rssfeed .= '<guid>https://wyremski.pl/skrypt/'.$script['url'].'</guid>';
	$rssfeed .= '<pubDate>'.date("D, d M Y H:i:s O", strtotime($script['date_update'])).'</pubDate>';
	$rssfeed .= '<description>';
	$rssfeed .= htmlspecialchars($script['description'], ENT_XML1, 'UTF-8').'';
	$rssfeed .= '&lt;br&gt;&lt;br&gt;&lt;a href="https://wyremski.pl/skrypt/'.$script['url'].'"&gt;&lt;img src="https://wyremski.pl/'.$script['image'].'" height="80"/&gt;&lt;/&gt;';
	$rssfeed .= '</description>';
    $rssfeed .= '</item>';
}
$rssfeed .= '</channel>';
$rssfeed .= '</rss>';

echo $rssfeed;

die();