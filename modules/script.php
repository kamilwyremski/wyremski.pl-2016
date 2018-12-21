<?php

if(!isset($settings['base_url'])){
	die('Access denied!');
}

if(isset($_GET['url']) and $_GET['url']!=''){
	$script = get_script($_GET['url']);
	if($script){
		
		$settings['title'] = $script['title']." - ".$settings['title'];
		$settings['description']= $script['description'];
		
		if($lang=='en'){
			$settings['link_alternate']['pl'] = '/skrypt/'.$script['url_alternate'];
			$settings['link_alternate']['en'] = '/script/'.$script['url'];
			$render_variables = array_merge($render_variables, array('script' => $script['url_alternate']));
		}else{
			$settings['link_alternate']['pl'] = '/skrypt/'.$script['url'];
			$settings['link_alternate']['en'] = '/script/'.$script['url_alternate'];
			$render_variables = array_merge($render_variables, array('script' => $script['url']));
		}
		
		$settings['logo_facebook'] = $settings['base_url'].'/'.$script['image'];
		$settings['og_url'] = 'skrypt/'.$script['url'];
		if($script['favicon']){$settings['favicon'] = $settings['base_url'].'/'.$script['favicon'];}
		
		$settings['active_menu'] = 'skrypty';
		
	}else{
		include('modules/404.php');
	}
}else{
	include('modules/404.php');
}
