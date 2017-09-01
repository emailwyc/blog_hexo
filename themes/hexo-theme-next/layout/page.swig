{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}
  {% block title %}{#
  #}{% set page_title_suffix = ' | ' + config.title %}{#
  #}{% if page.type === "categories" and not page.title %}{#
    #}{{ __('title.category') + page_title_suffix }}{#
  #}{% elif page.type === "tags" and not page.title %}{#
    #}{{ __('title.tag') + page_title_suffix }}{#
  #}{% else %}{#
    #}{{ page.title + page_title_suffix }}{#
  #}{% endif %}{#
#}{% endblock %}
{% block page_class %}page-post-detail{% endblock %}
{% block content %}
  <div id="posts" class="posts-expand">
    {##################}
    {### PAGE BLOCK ###}
    {##################}
    <div class="post-block page">
      {% include '_partials/page-header.swig' %}
      {#################}
      {### PAGE BODY ###}
      {#################}
      <div class="post-body{% if theme.han %} han-init-context{% endif %}{% if page.direction && page.direction.toLowerCase() === 'rtl' %} rtl{% endif %}">
        {# tagcloud page support #}
        {% if page.type === "tags" %}
          <div class="tag-cloud">
            <div class="tag-cloud-title">
                {{ _p('counter.tag_cloud', site.tags.length) }}
            </div>
            <div class="tag-cloud-tags">
              {{ tagcloud({min_font: 12, max_font: 30, amount: 200, color: true, start_color: '#ccc', end_color: '#111'}) }}
            </div>
          </div>
        {% elif page.type === 'categories' %}
          <div class="category-all-page">
            <div class="category-all-title">
                {{ _p('counter.categories', site.categories.length) }}
            </div>
            <div class="category-all">
              {{ list_categories() }}
            </div>
          </div>
        {% elif page.type === 'photo' %}
<style>
.album  h4{width:100%;margin:0 auto 30px auto;}

.album .pagination{width:100%;margin:30px auto 30px auto;}

.wall {display: block;position: relative;margin-bottom:10px;overflow:hidden;margin-left: -1.5%;margin-right: -1.5%;}

.wall-column {display: block;position: relative;width: 25%;float: left;padding: 0 1.5%;box-sizing: border-box;}

.wall-li {display: block;margin: 0 0 8% 0;padding: 5%;background:rgba(255,255,255,0.7);border-radius: 3px;position:relative;box-shadow: 0px 0  0px rgba(0, 0, 0, 0.05);transition:all 0.2s;overflow: hidden;box-sizing:border-box;position: relative;border:1px solid rgba(0,0,0,0.1);}

.wall-li:hover{border:1px solid #ff4200;box-shadow:0 0 10px #555;}

.wall-li img {display: block;width: 100%;margin: 0 0 5% 0;}

.wall-li p{ overflow: hidden; font-weight:bold;text-overflow: ellipsis; white-space: nowrap; width: 100%; font-size: 14px;padding-bottom:10px; }

.wall-li small{ font-size:12px; color: #777; display:inline-block;line-height:15px;overflow: hidden;text-overflow: ellipsis; white-space: nowrap;}

.wall-li small:nth-of-type(1){float:left}

.wall-li small:nth-of-type(2){float:right}



.show-btn{width:100%;height:100%;background:rgba(0,0,0,0.8);overflow:hidden;position:absolute;left:0;top:0;transform:scale(0);-webkit-transform:scale(0);transition:all 0.3s ease;-webkit-transition:all 0.3s ease;}

.show-btn a{display:inline-block;width:50%;text-align:center;top:45%;font-size:30px;position:absolute;}

.show-btn a i{color:#fff;}

.show-pic:hover i,.show-info:hover i{color:#ff6700}

.wall-li:hover .show-btn{transform:scale(1);-webkit-transform:scale(1);}

.show-pic{left:0;}

.show-info{right:0;}
</style>
 <ul class="wall baguetteBoxOne gallery" >
	<li class="wall-li img_loading">
		<a class="show-pic"href="https://github.com/lwzhang/blog/blob/master/photos/20150101_59aeaafff9d96b7cc24f13e5216e90ff.png?raw=true"title="杨青博客首页" >
		<img src="https://github.com/lwzhang/blog/blob/master/photos/20150101_59aeaafff9d96b7cc24f13e5216e90ff.png?raw=true" alt="杨青博客首页" title="杨青博客首页"/>
		</a>
		<p>杨青博客首页<small >2017-01-03</small></p>
		</li><li class="wall-li img_loading">
		<a class="show-pic"href="http://www.100txy.com/Upload/image/picture/20170103586b39b55ff94.jpg"title="杨青博客留言板" >
		<img src="http://www.100txy.com/Upload/image/picture/20170103586b39b55ff94.jpg" alt="杨青博客留言板" title="杨青博客留言板"/>
		</a>
		<p>杨青博客留言板<small >2017-01-03</small></p>
		</li><li class="wall-li img_loading">
		<a class="show-pic"href="http://www.100txy.com/Upload/image/picture/20170103586b39d48268c.jpg"title="杨青博客碎言碎语" >
		<img src="http://www.100txy.com/Upload/image/picture/20170103586b39d48268c.jpg" alt="杨青博客碎言碎语" title="杨青博客碎言碎语"/>
		</a>
		<p>杨青博客碎言碎语<small >2017-01-03</small></p>
	</li>            
</ul>
<script type="text/javascript" src="http://www.100txy.com/Template/xiao/Home/Public/js/album.js"></script>
<script type="text/javascript">
		$(function(){
		//瀑布流
			$('.wall').jaliswall({ item: '.wall-li' });
			var xlen=$(".wall .wall-column").length
			for (var x=0;x<=xlen;x++){
						$(".wall .wall-column").eq(x).css({
							"-webkit-animation-name":"zhengshang",
							"-webkit-animation-duration":x/5+0.5+"s",
							"animation-name":"zhengshang",
							"animation-duration":x/5+0.5+"s"
				});
			}
		});

</script>
        {% else %}
          {{ page.content }}
        {% endif %}
      </div>
      {#####################}
      {### END PAGE BODY ###}
      {#####################}
    </div>
    {######################}
    {### END PAGE BLOCK ###}
    {######################}
  </div>
{% endblock %}
{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
