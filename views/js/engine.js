$(document).ready(function(){

	var $menu = $('#menu');
	
	lazyload();
	
	function scroll() {
		if ($(window).height() >= $(document).height() || $(window).scrollTop() > 0) {
			$menu.addClass('moved');
		} else {
			$menu.removeClass('moved');
		}
		if($(window).width()>=768){
			$('.project_description').addClass('hoverElem');
		}else{
			$('.project_description').removeClass('hoverElem');
		}
	}
	scroll();
	document.onscroll = scroll;
	window.onresize = scroll;
	
	$('.project').each(function(){$(this).hoverdir();});
	
	$('#menu_open').click(function(){
		var $this = $(this), $nav = $('#menu_collapse .navbar-nav'), seconds = 100;
		if($this.hasClass('closed')){
			$nav.fadeOut(400);
			localStorage.menu_open = 'N';
		}else{
			$nav.show().children('li').css({'top':40, 'opacity':0}).each(function(){
				$(this).delay(seconds).animate({'top':0, 'opacity':1});
				seconds += 100;
			})
			localStorage.menu_open = 'T';
		}
		$this.toggleClass('closed').blur();
		$menu.toggleClass('active');
		return false;
	})
	if(localStorage.menu_open && localStorage.menu_open == 'T') {
		$('#menu_open').click();
	}
	
	var $text_typed = $('#text_typed .text');
	if($text_typed.length){
		$('#text_typed').css('opacity','1');
		var texts = $text_typed.text().split(' '), counter = text_index = text_char = text_length = 0, text = text_old = '';
		texts.pop();
		$text_typed.text('');
		setInterval(function () {
			if(!text_length){
				text_length = texts[text_index].length;
			}
			text_char = Math.floor(counter/4);
			if(text_char>text_length + 15){
				text_index++;
				if(text_index>=texts.length){
					text_index = 0;
				}
				text_length = counter = 0;
			}else if(text_char>text_length + 10){
				text = text.substring(0, text.length - 1);
				counter++;
			}else{
				text = texts[text_index].substring(0,text_char);
				counter++;
			}
			if(text_old!=text){
				$text_typed.text(text);
			}
			text_old = text;
		},70);
	}	
	
	var doAnimations = function() {
		var offset = $(window).scrollTop() + $(window).height(),$animatables = $('.animatable');
		if ($animatables.length == 0) {
			$(window).off('scroll', doAnimations);
		}
		$animatables.each(function(i) {
			var $animatable = $(this);
			if (($animatable.offset().top + 80) < offset) {
				$animatable.removeClass('animatable').addClass('animated');
			}
		});
	};

	$(window).on('scroll', doAnimations);
	$(window).trigger('scroll');
	
	$('#accept-cookies-checkbox').click(function(){
		localStorage.cookies_accepted = true;
		$("#cookies-message").remove();
		return false;
	})
	
	if(!localStorage.cookies_accepted) {
		document.getElementById("cookies-message").style.display="block";
	} 
});

var onloadCaptcha = function() {
    grecaptcha.render('g-recaptcha', {
      'sitekey' : '6Ld66YAUAAAAACgwCy8Nv91JIeiXb4lzQnEKLvey',
      'callback' : function() {
		$('#contact input[type=submit]').attr("disabled", false);
	  }
    });
};
  