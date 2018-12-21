
<div class="container padding_big_top padding_big_bottom" id="projects_inside">
	{% for item in projects %}
		<div class="col-lg-3 col-md-4 col-xs-6 project animatable fadeInUp" itemscope itemtype="http://schema.org/Product">
			{% if settings.amp==0 %}<a href="{{item.url}}" title="{{item.name}}" target="_blank" rel="nofollow noopener"><img src="upload/images/loading.gif" class="lazyload" data-src="{{item.image}}" alt="{{item.name}}" itemprop="image"></a>{% endif %}
			<div class="project_description text-center hoverElem background_grey">
				<div class="project_description_inside">
					<a href="{{item.url}}" title="{{item.name}}" target="_blank" rel="nofollow noopener"><h4 itemprop="name" class="text-uppercase">{{item.name}}</h4></a>
					<p itemprop="description">{{item.description}}</p>
					<a href="{{item.url}}" title="{{item.name}}" target="_blank" itemprop="url" rel="nofollow noopener">{{item.url|replace({'http://':'','https://':'','/':''})}}</a>
				</div>
			</div>
		</div>
	{% endfor %}
</div>

