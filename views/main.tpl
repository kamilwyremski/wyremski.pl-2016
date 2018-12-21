<!doctype html>
<html lang="{{lang}}" {% if settings.amp %}amp{% endif %}>
<head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
	<meta name="keywords" content="{{settings.keywords}}">
	<meta name="description" content="{{settings.description}}">
	<meta name="author" content="Kamil Wyremski">
	<title>{{settings.title}}</title>
	
	{% block head %}{% endblock %}
		
	<!-- amp -->
	{% if settings.amp %}
		<link rel="canonical" href="{{settings.base_url}}{% if lang=='en' %}/en{{settings.link_alternate.en}}{% else %}{{settings.link_alternate.pl}}{% endif %}">
		<script type="application/ld+json">
			{
				"@context": "http://schema.org",
				"@type": "Person",
				"name": "Kamil Wyremski"
			}
		</script>
		<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
		<script async src="https://cdn.ampproject.org/v0.js"></script>
	{% else %}
		<link rel="amphtml" href="{{settings.base_url}}{% if lang=='en' %}/en{{settings.link_alternate.en}}{% else %}{{settings.link_alternate.pl}}{% endif %}/amp">
		<base href="{{settings.base_url}}/">
	{% endif %}
	
	<!-- integration facebook fb -->
	<meta property="og:image" content="{{settings.logo_facebook}}">
	<meta property="og:description" content="{{settings.description}}"/>
	<meta property="og:title" content="{{settings.title}}"/>
	<meta property="og:type" content="website"/>
	<meta property="og:site_name" content="{{settings.title}}"/>
	<meta property="og:locale" content="{% if lang=='en' %}en_US{% else %}pl_PL{% endif %}"/>
	<meta property="og:url" content="{{settings.base_url}}/{{settings.og_url}}">
	<meta property="fb:app_id" content="531870546992716">	
	
	<!-- integration twitter -->
	<meta name="twitter:card" content="summary"/>
	<meta name="twitter:title" content="{{settings.title}}"/>
	<meta name="twitter:description" content="{{settings.description}}"/>
	<meta name="twitter:image" content="{{settings.logo_facebook}}"/>
	
	<!-- integration pinterest -->
	<meta name="p:domain_verify" content="c2fb247846bc4133916bec76263b6941"/>
	
	<!-- other -->
	<link rel="alternate" hreflang="pl" href="{{settings.base_url}}{{settings.link_alternate.pl}}" />
	<link rel="alternate" hreflang="en" href="{{settings.base_url}}/en{{settings.link_alternate.en}}" />
	<link rel="manifest" href="/manifest.json"/>
	<meta name="theme-color" content="#3f5a6f"/>
	<meta name="msapplication-config" content="/browserconfig.xml" />
	<link rel="mask-icon" href="/upload/images/favicon/favicon.svg" color="#3f5a6f">
	
	<!-- favicon -->
	<link rel="apple-touch-icon" sizes="57x57" href="/upload/images/favicon/favicon-57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/upload/images/favicon/favicon-60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/upload/images/favicon/favicon-72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/upload/images/favicon/favicon-76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/upload/images/favicon/favicon-114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/upload/images/favicon/favicon-120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/upload/images/favicon/favicon-144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/upload/images/favicon/favicon-152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/upload/images/favicon/favicon-180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/upload/images/favicon/favicon-192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/upload/images/favicon/favicon-32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/upload/images/favicon/favicon-96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/upload/images/favicon/favicon-16.png">
	<link rel="shortcut icon" href="{{settings.favicon}}"/>
	
	<!-- css -->
	{% block css %}
		{% if settings.amp %}
			<style amp-custom>{{ source("css/amp.css") }}</style>
		{% else %}
			<style>{{ source("css/bootstrap-custom.min.css") }}</style>
			<style>{{ source("css/font-awesome.min.css") }}</style>
			<style>{{ source("css/languages.min.css") }}</style>
			<style>{{ source("css/style.css") }}</style>
		{% endif %}
	{% endblock %}
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" id="menu">
	<div class="container container-full">
		<div class="navbar-header">
			<a class="navbar-brand" href="{{settings.base_url}}{% if lang=='en' %}/en{% endif %}" title="{% if lang=='en' %}Kamil Wyremski - Web Designer{% else %}Kamil Wyremski - tworzenie stron www{% endif %}">KAMIL WYREMSKI</a>
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu_collapse" aria-expanded="false" aria-label="Menu">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<button type="button" class="navbar-toggle collapsed hidden-xs" id="menu_open" aria-label="Menu">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<div class="collapse navbar-collapse" id="menu_collapse">
			<ul class="nav navbar-nav navbar-right text-uppercase">
				<li class="{% if settings.active_menu=='index' %}active{% endif %}">
					{% if lang=='en' %}<a href="{{settings.base_url}}/en" title="Home">Home</a>
					{% else %}<a href="{{settings.base_url}}" title="Strona główna">Home</a>{% endif %}
				</li>
				<li class="{% if settings.active_menu=='skrypty' %}active{% endif %}">
					{% if lang=='en' %}<a href="/en/scripts" title="Scripts created by me">Scripts</a>
					{% else %}<a href="/skrypty" title="Skrypty stron internetowych">Skrypty</a>{% endif %}
				</li>
				<li class="{% if settings.active_menu=='projekty' %}active{% endif %}">
					{% if lang=='en' %}<a href="/en/projects" title="Projects - the websites created by me">Projects</a>
					{% else %}<a href="/projekty" title="Moje portfolio - strony stworzone przeze mnie">Projekty</a>{% endif %}
				</li>
				<li class="{% if settings.active_menu=='kontakt' %}active{% endif %}">
					{% if lang=='en' %}<a href="/en/contact" title="Contact with me">Contact</a>
					{% else %}<a href="/kontakt" title="Kontakt ze mną">Kontakt</a>{% endif %}
				</li>
				<li class="hidden-xs">
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-label="Language">
							<span class="lang-sm lang-lbl text-uppercase small" lang="{{lang}}"></span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/en{{settings.link_alternate.en}}" title="You can see this website in english"><span class="lang-sm lang-lbl small" lang="en"></span></a></li>
							<li><a href="{{settings.base_url}}{{settings.link_alternate.pl}}" title="Zobacz stronę po polsku"><span class="lang-sm lang-lbl small" lang="pl"></span></a></li>
						</ul>
					</div>
				</li>
				<li class="visible-xs-block"><a href="/en{{settings.link_alternate.en}}" title="You can see this website in english"><span class="lang-sm lang-lbl" lang="en"></span></a></li>
				<li class="visible-xs-block"><a href="{{settings.base_url}}{{settings.link_alternate.pl}}" title="Zobacz stronę po polsku"><span class="lang-sm lang-lbl" lang="pl"></span></a></li>
			</ul>
		</div>
	</div>
</nav>

{% block content %}{% endblock %}
	
<footer>
	<div class="container">
		<div class="col-md-4 padding_bottom">
			<p>Kamil Wyremski</p>
			{% if lang=='en' %}
				<p>High-quality, modern, responsive, SEO friendly websites. Construction of secure systems and web applications. Unique and original ideas to make sure your website is a success!</p>
			{% else %}
				<p>Tworzenie nowoczesnych, sematycznych, zgodnych z SEO i responsywnych stron internetowych. Budowa bezpiecznych systemów i aplikacji webowych. Gwarancja nowoczesności i unikalności w sieci!</p>
			{% endif %}
			{% if not settings.amp %}<p>{% if lang=='en' %}<a href="#" data-toggle="modal" data-target="#privacy_policy" title="Privacy policy">Privacy policy</a>{% else %}<a href="#" data-toggle="modal" data-target="#privacy_policy" title="Polityka prywatności">Polityka prywatności</a>{% endif %}</p>{% endif %}
		</div>
		<div class="col-md-4 text-center padding_bottom">
			<p><i class="fa fa-at" aria-hidden="true"></i> <a href="mailto:kamil.wyremski@gmail.com" title="{% if lang=='en' %}Write to me{% else %}Napisz do mnie{% endif %}">kamil.wyremski@gmail.com</a></p>
			<p><i class="fa fa-skype" aria-hidden="true"></i> <a href="skype:kamil.wyremski" title="{% if lang=='en' %}Call to me by Skype{% else %}Zadzwoń do mnie przez Skype{% endif %}">kamil.wyremski</a></p>
		</div>
		{% if settings.amp==0 %}
			<div class="col-md-4 text-center padding_bottom">
				<div itemscope itemtype="http://schema.org/Organization">
					<link itemprop="url" href="{{ settings.base_url }}">
					<a href="https://www.facebook.com/wyremskipl/" title="{% if lang=='en' %}My profile on Facebook{% else %}Mój profil na Facebook{% endif %}" target="_blank" rel="noopener" itemprop="sameAs"><i class="fa fa-facebook-official fa-2x" aria-hidden="true"></i></a>
					<a href="https://plus.google.com/u/0/102325004299979143485?rel=author" title="{% if lang=='en' %}My profile on Google Plus{% else %}Mój profil na Google Plus{% endif %}" target="_blank" rel="publisher noopener" itemprop="sameAs"><i class="fa fa-google-plus-square fa-2x" aria-hidden="true"></i></a>
					<a href="http://linkedin.com/in/kamil-wyremski" title="{% if lang=='en' %}View my profile on Linkedin!{% else %}Mój profil na Linkedin{% endif %}" target="_blank" rel="noopener" itemprop="sameAs"><i class="fa fa-linkedin-square fa-2x" aria-hidden="true"></i></a>
					<a href="https://twitter.com/kamil_wyremski" title="{% if lang=='en' %}My profile on Twitter{% else %}Mój profil na Twitter{% endif %}" target="_blank" rel="noopener" itemprop="sameAs"><i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i></a>
					<a href="https://pl.pinterest.com/kamilwyremski/" title="{% if lang=='en' %}My profile on Pinterest{% else %}Mój profil na Pinterest{% endif %}" target="_blank" rel="noopener" itemprop="sameAs"><i class="fa fa-pinterest-square fa-2x" aria-hidden="true"></i></a><br>
					<a href="https://github.com/kamilwyremski" title="{% if lang=='en' %}My profile on GitHub{% else %}Mój profil na GitHub{% endif %}" target="_blank" rel="noopener" itemprop="sameAs"><i class="fa fa-github-square fa-2x" aria-hidden="true"></i></a>
					<a href="https://www.youtube.com/channel/UCR1g4AKZ2Swr4YCApWQKkpQ" title="{% if lang=='en' %}My profile on Youtube{% else %}Mój kanał na Youtube{% endif %}" target="_blank" rel="noopener" itemprop="sameAs"><i class="fa fa-youtube-square fa-2x" aria-hidden="true"></i></a>
					<a href="https://stackoverflow.com/users/8337251/kamil-wyremski" title="{% if lang=='en' %}My profile on StackOverflow{% else %}Mój profil na StackOverflow{% endif %}" target="_blank" rel="noopener" itemprop="sameAs"><i class="fa fa-stack-overflow fa-2x" aria-hidden="true"></i></a>
					<a href="http://blog.wyremski.pl" title="{% if lang=='en' %}View my blog!{% else %}Mój blog programisty{% endif %}" target="_blank" rel="noopener"><i class="fa fa-external-link-square fa-2x" aria-hidden="true"></i></a>
					<a href="/feed" title="{% if lang=='en' %}RSS Channel{% else %}Kanał RSS - bądź na bieżąco z nowymi skryptami{% endif %}" target="_blank" rel="noopener"><i class="fa fa-rss-square fa-2x" aria-hidden="true"></i></a>
				</div>
			</div>
		{% endif %}
	</div>
	<div class="container text-center">
		<p class="small">Copyright © 2013 - 2018 by Kamil Wyremski. All rights reserved</p>
	</div>
</footer>
{% if not settings.amp %}
	<div id="cookies-message">{% if lang=='en' %}This site uses cookies, so that our service may work better. See <a href="#" data-toggle="modal" data-target="#privacy_policy" title="Privacy policy">privacy policy</a>{% else %}Ta strona używa ciasteczek (cookies), dzięki którym nasz serwis może działać lepiej. Zobacz <a href="#" data-toggle="modal" data-target="#privacy_policy" title="Polityka prywatności">politykę prywatności</a>{% endif %}<a href="#" id="accept-cookies-checkbox">{% if lang=='en' %}I accept{% else %}Akceptuję{% endif %}</a></div>
{% endif %}
{% block javascript %}
	{% if settings.amp==0 %}
		<!-- javascript js -->
		<script>
			if ('serviceWorker' in navigator) {
				window.addEventListener('load', function() {
					navigator.serviceWorker.register('/service-worker.js');
				});
			}
		</script>
		<script>{{ source("js/jquery-3.3.1.min.js") }}</script>
		<script>{{ source("js/bootstrap-custom.min.js") }}</script>
		<script>{{ source("js/jquery.hoverdir.js") }}</script>
		<script>{{ source("js/lazyload.min.js") }}</script>
		<script>{{ source("js/engine.js") }}</script>
		<!-- google analytics -->
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		  ga('create', 'UA-46218779-1', 'wyremski.pl');
		  ga('send', 'pageview');
		</script>
	{% endif %}
{% endblock %}
{% if not settings.amp %}
<div class="modal fade" id="privacy_policy" tabindex="-1" role="dialog" aria-labelledby="{% if lang=='en' %}Privacy Policy{% else %}Polityka prywatności{% endif %}">
  <div class="modal-dialog modal-lg" role="document">
{% endif %}
    <div class="modal-content">
      <div class="modal-header">
	  {% if not settings.amp %}
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	  {% endif %}
        <h4 class="modal-title">{% if lang=='en' %}Privacy Policy{% else %}Polityka prywatności{% endif %}</h4>
      </div>
      <div class="modal-body">
		{% if lang=='en' %}
			<h4>Administrator:</h4>
			<p>The administrator of your personal data in accordance with the provisions on the protection of personal data is Kamil Wyremski.</p>
			<h4>Processing of personal data:</h4>
			<p>Your permissions. Thanks to RODO, you can enjoy potential rights regarding the processing of your personal data. You have the right to:</p>
			<ol>
			<li>access to your personal data,</li>
			<li>correcting your personal information</li>
			<li>delete your personal information</li>
			<li>limitations on the processing of your personal data,</li>
			<li>to object to the processing of your personal data,</li>
			<li>transferring your personal data</li>
			<li>file a complaint to the supervisory authority,</li>
			<li>withdrawal of consent to the processing of your personal data, if you previously agreed to it.</li>
			</ol>
			<p>If you want to know more about this topic, see details in art. 16 - 21 RODO.<br>
			You always have the option of requesting me to provide you with information about what data I have about you and for what purpose I am processing it. If you want to get this information, send a message to: kamil.wyremski@gmail.com. However, I have made every effort to ensure that all the most important information is presented in the privacy policy you are reading. However, if you have any questions regarding the processing of your personal data, you can submit an inquiry to the above-mentioned e-mail address.</p>
			<h4>Security Guarantee.</h4>
			<p>I guarantee you the security and confidentiality of personal information you have provided to me. I ensure that all personal data protection measures that are required by law are taken. In addition, I assure you that all personal data is properly protected so that unauthorized persons can not access it.</p>
			<h4>Email contact.</h4>
			<p>If you contact me via e-mail or use the contact form on the website, you give me your e-mail address (and other personal data if you include it in the message body).<br>
			In this case, your data is processed to ensure contact with you. The legal basis is art. 6 par. 1 lit. and the RODO, regarding your consent resulting from initiating contact with me. The legal basis for the processing of your data after the end of contact is art. 6 par. 1 lit. c RODO, which justifies their processing in the form of archiving of e-mail correspondence for internal needs.<br>
			As mentioned above, the content of the correspondence can be archived and I can not precisely determine when it will be deleted. You have the right to view the history of correspondence that you carried with me (of course only if it was subject to archiving). You can also demand removal, but sometimes archiving is justified, for example to defend against potential claims that you could submit.</p>
			<h4>Cookies (web cookies) and web beacons:</h4>
			<p>My website, like most other websites, uses cookies in order to provide you with the most pleasant use of it.<br>
			I reserve the right to use cookies (cookies) and so-called session storage. These files are saved on your computer. They are used for:<br>
			a) adjusting the content of the website to the user's preferences and optimizing the use of websites,<br>
			b) providing users with advertising content more tailored to their interests.<br>
			The website displays ads from external suppliers. Advertising providers (eg Google) may use cookies and web beacons, they can get information about your IP address and type of browser used, check if Flash add-on is installed, etc. Thanks to cookies, sirens and knowledge of the ad's IP address can decide about the content of ads.<br>
			Web browsers, and some Firewalls, allow you to disable cookies and signaling devices, or its limitation for everyone or only for selected websites. However, disabling cookies and signaling devices may prevent the website from working properly.<br>
			Modern browsers allow browsing the so-called websites. "Private (incognito) mode" which usually means that none of the websites visited will be remembered in your browser's local history, and the downloaded cookies will be deleted after you finish working with the browser. A detailed description of the "private mode" is available in the browser's help.</p>
			<p>Cookies (cookies) are divided into third-party cookies and cookies. Below I present the difference:<br>
			Own cookies are used to make the site work properly.<br>
			Third party cookies. Our website, like most of today's websites, uses functions provided by third parties, which involves the use of cookies from third parties.<br>
			Analysis and statistics. I use cookies to track website statistics, such as the number of visitors, the type of operating system and web browser used to browse the site, time spent on the website, visited subpages, etc. I use Google Analytics in this area, which involves the use of cookies by Google LLC. This data can be used for analytics but also for marketing activities. Therefore, I would like to inform you that it is possible to set up a web browser that prevents cookies from being stored on the User's end device. In this situation, the use of the website by the User may be difficult.</p>
			<h4>Server logs.</h4>
			<p>Using the site involves sending queries to the server on which the page is stored. Each query addressed to the server is saved in the server logs.<br>
			Logs include Your IP address, server date and time, information about the web browser and operating system you are using. Logs are saved and stored on the server.<br>
			The data stored in the server logs is not associated with specific people using the site and is not used by us to identify you.<br>
			The server logs are only auxiliary material used to administer the site, and their content is not disclosed to anyone except those authorized to administer the server.</p>
		{% else %}
			<h4>Administrator</h4>
			<p>Administratorem Twoich danych osobowych zgodnie z przepisami o ochronie danych osobowych jest Kamil Wyremski.</p>
			<h4>Przetwarzanie danych osobowych</h4>
			<p>Dzięki RODO możesz cieszyć się potencjalnymi uprawnieniami, dotyczącymi przetwarzania Twoich danych osobowych. Masz prawo do:</p>
			<ol>
			<li>dostępu do swoich danych osobowych,</li>
			<li>sprostowania swoich danych osobowych,</li>
			<li>usunięcia swoich danych osobowych,</li>
			<li>ograniczenia przetwarzania swoich danych osobowych,</li>
			<li>wniesienia sprzeciwu co do przetwarzania Twoich danych osobowych,</li>
			<li>przenoszenia swoich danych osobowych,</li>
			<li>wniesienia skargi do organu nadzorczego,</li>
			<li>odwołania zgody na przetwarzanie swoich danych osobowych, jeżeli wcześniej taką zgodę wyraziłeś.</li>
			</ol>
			<p>Jeżeli chcesz wiedzieć więcej na ten temat, szczegóły znajdziesz w art. 16 – 21 RODO.<br />
			Zawsze masz też możliwość zażądać ode mnie udostępnienia Ci informacji o tym, jakie dotyczące Cię dane posiadam i w jakim celu je przetwarzam. Jeśli chcesz uzyskać te informacje, wyślij wiadomość na adres: kamil.wyremski@gmail.com. Dołożyłem jednak starań, aby wszystkie najważniejsze informacje zostały przedstawione w polityce prywatności, którą właśnie czytasz. Jeśli jednak masz jakiekolwiek pytania dotyczące przetwarzania Twoich danych osobowych, możesz złożyć zapytanie na wyżej wymieniany adres e-mail.</p>
			<h4>Gwarancja bezpieczeństwa</h4>
			<p>Gwarantuję Ci bezpieczeństwo i poufność danych osobowych, które mi przekazałeś. Zapewniam podjęcie wszelkich środków ochrony danych osobowych, które są wymagane przez przepisy. Ponadto, zapewniam Cię, że wszelkie dane osobowe są odpowiednio chronione, aby osoby nieupoważnione nie miały do nich dostępu.</p>
			<h4>Kontakt e-mailowy</h4>
			<p>Jeśli kontaktujesz się ze mną za pośrednictwem poczty elektronicznej lub korzystasz z formularza kontaktowego zamieszczonego na stronie, przekazujesz mi w ten sposób swój adres e-mail (oraz inne dane osobowe, jeśli zamieścisz je w treści wiadomości).<br />
			W takim przypadku, Twoje dane są przetwarzane w celu zapewnienia kontaktu z Tobą. Podstawą prawną jest art. 6 ust. 1 lit. a RODO, dotyczący Twojej zgody wynikającej z zainicjowania kontaktu ze mną. Podstawą prawną przetwarzania Twoich danych po zakończeniu kontaktu jest art. 6 ust. 1 lit. c RODO, który usprawiedliwia ich przetwarzanie w postaci archiwizacji korespondencji mailowej na potrzeby wewnętrzne.<br />
			Jak wspomniałem wyżej, treść korespondencji może być archiwizowana i nie potrafię dokładnie określić, kiedy będzie usunięta. Masz prawo do wglądu do historii korespondencji, którą ze mną prowadziłeś (oczywiście tylko jeżeli podlegała archiwizacji). Możesz także domagać się jej usunięcia, jednak czasem archiwizacja jest uzasadniona, np. w celu obrony przed potencjalnymi roszczeniami, które mógłbyś złożyć.</p>
			<h4>Ciasteczka (pliki cookie) i sygnalizatory WWW (web beacon)</h4>
			<p>Moja strona, podobnie jak większość innych stron internetowych, wykorzystuje pliki cookies, w celu zapewnienia Ci jak najprzyjemniejszego korzystania z niej.<br />
			Zastrzegam sobie możliwość do wykorzystania plików cookie (ciasteczek) oraz tzw session storage. Pliki te są zapisywane na Twoim komputerze. Służą one do:<br />
			a) dostosowania zawartości serwisu do preferencji użytkownika oraz optymalizacji korzystania ze stron internetowych,<br />
			b) dostarczania użytkownikom treści reklamowych bardziej dostosowanych do ich zainteresowań.<br />
			Serwis wyświetla reklamy pochodzące od zewnętrznych dostawców. Dostawcy reklam (np. Google) mogą używać ciasteczek i sygnalizatorów WWW, mogą uzyskać informację o Twoim adresie IP i typie używanej przeglądarki, sprawdzić czy zainstalowany jest dodatek Flash itp. Dzięki ciasteczkom, sygnalizatorom i znajomości adresu IP dostawcy reklam mogą decydować o treści reklam.<br />
			Przeglądarki internetowe, oraz niektóre Firewalle, umożliwiają wyłączenie obsługi ciasteczek i sygnalizatorów, lub jej ograniczenie dla wszystkich lub tylko dla wybranych stron WWW. Jednak wyłączenie obsługi ciasteczek i sygnalizatorów może uniemożliwić poprawne działanie serwisu.<br />
			Współczesne przeglądarki umożliwiają przeglądanie stron www tzw. „trybie prywatnym (incognito)” co zazwyczaj oznacza, że żadna z odwiedzonych stron www nie zostanie zapamiętana w lokalnej historii przeglądarki, a pobrane ciasteczka zostaną skasowane po zakończeniu pracy z przeglądarką. Szczegółowy opis „trybu prywatnego” jest dostępny w pomocy przeglądarki.</p>
			<p>Ciasteczka (cookies) dzielą się na cookies własne i cookies podmiotów trzecich. Poniżej przedstawiam różnicę:<br />
			Cookies własne jest wykorzystywane, aby strona działała prawidłowo.<br />
			Cookies podmiotów trzecich: Strona ta wykorzystuje funkcje zapewniane przez podmioty trzecie, co wiąże się z wykorzystywaniem plików cookies pochodzących od podmiotów trzecich.<br />
			Analiza i statystyka. Wykorzystuję cookies do śledzenia statystyk strony, takich jak liczba osób odwiedzających, rodzaj systemu operacyjnego i przeglądarki internetowej wykorzystywanej do przeglądania strony, czas spędzony na stronie, odwiedzone podstrony etc. Korzystam w tym zakresie z Google Analytics, co wiąże się z wykorzystaniem plików cookies firmy Google LLC. Dane te mogą być wykorzystywane do analityki ale też do działań marketingowych. W związku z tym informuję, że istnieje możliwość takiej konfiguracji przeglądarki internetowej, która uniemożliwia przechowywanie plików cookies na urządzeniu końcowym Użytkownika. W takiej sytuacji, korzystanie ze strony przez Użytkownika może być utrudnione.</p>
			<h4>Logi serwera</h4>
			<p>Korzystanie ze strony wiąże się z przesyłaniem zapytań do serwera, na którym przechowywana jest strona. Każde zapytanie skierowane do serwera zapisywane jest w logach serwera.<br />
			Logi obejmują m.in. Twój adres IP, datę i czas serwera, informacje o przeglądarce internetowej i systemie operacyjnym z jakiego korzystasz. Logi zapisywane i przechowywane są na serwerze.<br />
			Dane zapisane w logach serwera nie są kojarzone z konkretnymi osobami korzystającymi ze strony i nie są wykorzystywane przeze mnie w celu Twojej identyfikacji.<br />
			Logi serwera stanowią wyłącznie materiał pomocniczy służący do administrowania stroną, a ich zawartość nie jest ujawniana nikomu poza osobami upoważnionymi do administrowania serwerem.</p>
		{% endif %}
      </div>
	  {% if not settings.amp %}
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">{% if lang=='en' %}Close{% else %}Zamknij{% endif %}</button>
      </div>
	  {% endif %}
    </div>
{% if not settings.amp %}
  </div>
</div>
{% else %}
	<br><br>
{% endif %}
</body>
</html>
