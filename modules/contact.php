<?php

session_start();

if(!isset($settings['base_url'])){
	die('Access denied!');
}

$settings['active_menu'] = 'kontakt';

if($lang=='en'){
	$settings['title'] = "Contact - ".$settings['title'];
	$settings['description'] = 'Contact form that will allow you a quick way to contact me. Feel free to contact me! Kamil Wyremski.';
	$settings['og_url'] = 'contact';
}else{
	$settings['title'] = "Kontakt - ".$settings['title'];
	$settings['description'] = 'Formularz kontaktowy który pozwoli Ci w szybki sposób skontaktować się ze mną. Zapraszam do kontaktu! Kamil Wyremski.';
	$settings['og_url'] = 'kontakt';
}

$settings['link_alternate']['en'] = '/contact';
$settings['link_alternate']['pl'] = '/kontakt';

$contact_info = $contact_error = $input = false;

if(isset($_POST['action']) and $_POST['action']=='send_message' and isset($_POST['email']) and isset($_POST['message']) and isset($_POST['subject']) and isset($_POST['g-recaptcha-response']) and isset($_POST['rules'])){

	$response=json_decode(file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=&response=".$_POST['g-recaptcha-response']."&remoteip=".$_SERVER['REMOTE_ADDR']), true);
    if($response['success'] == false){
		if($lang=='en'){
			$contact_error['captcha'] = "Show that you are not a robot!";
		}else{
			$contact_error['captcha'] = "Pokaż że nie jesteś robotem!";
		}
	}else{
		if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
			if($lang=='en'){
				$contact_error['email'] = "Incorrect e-mail address.";
			}else{
				$contact_error['email'] = "Nieprawidłowy adres email.";
			}
		}
		if($_POST['message']==''){
			if($lang=='en'){
				$contact_error['message'] = "Enter Your message to me";
			}else{
				$contact_error['message'] = "Wpisz wiadomość do mnie";
			}
		}
		if($_POST['subject']==''){
			if($lang=='en'){
				$contact_error['subject'] = "Enter the subject of your message";
			}else{
				$contact_error['subject'] = "Wpisz temat wiadomości";
			}
		}
	}
	
	if($contact_error){
		$input = array('email'=>$_POST['email'], 'subject'=>$_POST['subject'], 'message'=>$_POST['message']);
	}else{
		
		$header = 'Reply-To: <'.$_POST['email']."> \r\n"; 
		$header .= "MIME-Version: 1.0 \r\n"; 
		
		$message = '<!doctype html><html lang="pl"><head><meta charset="utf-8"></head><body><p>Witaj!<br>Została do Ciebie wysłana wiadomość ze strony <a href="'.$settings['base_url'].'">'.$settings['base_url'].'</a> od:</p><table><tr><td>Adres e-mail:</td><td><b>'.$_POST['email'].'</b></td></tr><tr><td>Wiadomość:</td><td>'.$_POST['message'].'</td></tr><tr><td>Adres IP:</td><td>'.get_client_ip().'</td></tr>';
		
		$geolocation = geolocation();
		if($geolocation){
			$message .= '<tr><td>Lokalizacja użytkownika:</td><td>'.$geolocation['lat'].', '.$geolocation['long'].'</td></tr>';
		}
		
		$message .= '</table>';
		
		$subject = "=?UTF-8?B?".base64_encode($_POST['subject'])."?=";

		if(isset($_FILES['attachment']) and $_FILES['attachment']['name']!=''){

			$file_tmp_name    = $_FILES['attachment']['tmp_name'];
			$file_name        = $_FILES['attachment']['name'];
			$file_size        = $_FILES['attachment']['size'];
			$file_type        = $_FILES['attachment']['type'];
			$file_error       = $_FILES['attachment']['error'];
			
			if($file_error==0){
				$handle = fopen($file_tmp_name, "r");
				$content = fread($handle, $file_size);
				fclose($handle);
				$encoded_content = chunk_split(base64_encode($content));

				$boundary = md5("sanwebe"); 

				$header .= "Content-Type: multipart/mixed; boundary = $boundary\r\n\r\n"; 
				
				$body = "--$boundary\r\n";
				$body .= "Content-Type: text/html; charset=utf-8\r\n";
				$body .= "Content-Transfer-Encoding: base64\r\n\r\n"; 
				$body .= chunk_split(base64_encode($message)); 
				
				$body .= "--$boundary\r\n";
				$body .="Content-Type: $file_type; name=\"$file_name\"\r\n";
				$body .="Content-Disposition: attachment; filename=\"$file_name\"\r\n";
				$body .="Content-Transfer-Encoding: base64\r\n";
				$body .="X-Attachment-Id: ".rand(1000,99999)."\r\n\r\n"; 
				$body .= $encoded_content; 
				$message = $body;
			}

		}else{
			$header .= "Content-Type: text/html; charset=UTF-8"; 
		}
		
		$message .= '</body></html>';

		mail('kamil.wyremski@gmail.com', $subject, $message, $header);

		$contact_info = true;
	}
}

$render_variables = array_merge($render_variables, array('contact_info' => $contact_info, 'contact_error' => $contact_error, 'input' => $input));

