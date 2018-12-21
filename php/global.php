<?php

function get_projects($limit = false){
	global $lang;
	$projects_json = json_decode(file_get_contents(realpath(dirname(__FILE__)).'/../json/projects.json'), true);
	foreach($projects_json['projects'] as $key => $project){
		if ($limit && $key == $limit) break;
		$data['name'] = $project['name'];
		$data['description'] = $project['description'][$lang];
		$data['url'] = $project['url'];
		$data['image'] = $project['image'];
		$projects[] = $data;
	}
	return($projects);
}

function get_scripts($limit = false){
	global $lang, $lang_alternate;
	$scripts_json = json_decode(file_get_contents(realpath(dirname(__FILE__)).'/../json/scripts.json'), true);
	foreach($scripts_json['scripts'] as $key => $script){
		if ($limit && $key == $limit) break;
		$data['name'] = $script['name'][$lang];
		$data['title'] = $script['title'][$lang];
		$data['url'] = $script['url'][$lang];
		$data['url_alternate'] = $script['url'][$lang_alternate];
		$data['image'] = $script['image'];
		$data['description'] = $script['description'][$lang];
		$data['favicon'] = $script['favicon'];
		$data['date_update'] = $script['date_update'];
		$scripts[$data['url']] = $data;
	}
	return($scripts);
}

function get_script($url){
	$scripts = get_scripts();
	if(isset($scripts[$url])){
		return $scripts[$url];
	}
	return false;
}

function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
       $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function geolocation(){
	$query = @unserialize(file_get_contents('http://ip-api.com/php/'.get_client_ip()));
	if($query and isset($query['lat']) and isset($query['lon'])){
		return array('lat'=>$query['lat'],'long'=>$query['lon']);
	}else{
		$geo = unserialize(file_get_contents('http://www.geoplugin.net/php.gp?ip='.get_client_ip()));
		if($geo){
			return array('lat'=>$geo['geoplugin_latitude'],'long'=>$geo['geoplugin_longitude']);
		}else{
			$curlSession = curl_init();
			curl_setopt($curlSession, CURLOPT_URL, 'http://freegeoip.net/json/'.get_client_ip());
			curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
			curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);
			$jsonData = json_decode(curl_exec($curlSession));
			curl_close($curlSession);
			if($jsonData){
				$lat = $jsonData->latitude;
				$long = $jsonData->longitude;
				if($lat and $long){
					return array('lat'=>$lat,'long'=>$long);
				}
			}
		}
	}
	return false;
}

