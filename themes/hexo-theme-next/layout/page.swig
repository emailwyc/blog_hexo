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

.main-inner { margin-top: 10px !important;}
.album  h4{width:100%;margin:0 auto 30px auto;}.album .pagination{width:100%;margin:30px auto 30px auto;}
.wall {display: block;position: relative;margin-bottom:10px;overflow:hidden;margin-left: -1.5%;margin-right: -1.5%;}
.wall-column {display: block;position: relative;width: 25%;float: left;padding: 0 1.5%;box-sizing: border-box;}
.wall-li {display: block;margin: 0 0 8% 0;padding: 5%;background:rgba(255,255,255,0.7);border-radius: 3px;position:relative;box-shadow: 0px 0  0px rgba(0, 0, 0, 0.05);transition:all 0.2s;overflow: hidden;box-sizing:border-box;position: relative;border:1px solid rgba(0,0,0,0.1);}
.wall-li:hover{border:1px solid #ff4200;box-shadow:0 0 10px #555;}
.wall-li img {display: block;width: 100%;margin: 0 0 5% 0;}
.wall-li p{ overflow: hidden; font-weight:bold;text-overflow: ellipsis; white-space: nowrap; width: 100%; font-size: 14px;padding-bottom:5px;margin-bottom: 5px; }
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
.img_loading{background:rgba(255,255,255,0.6) url(/images/myloading.gif) no-repeat center center;}
.img_loading img{    opacity: 0;}
@media screen and (min-width:320px) and (max-width:768px){
    .wall-column{width:50%;}
    .wall-li p,.wall-li small{font-size:12px;padding:0;}
    .wall{margin-left:-1%;margin-right:-1%;}

}
</style>
<div class="instagram">
<ul class="wall baguetteBoxOne gallery img-box-ul" >
</ul>
</div>
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
