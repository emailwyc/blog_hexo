<!DOCTYPE html>
{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.use_motion %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}
<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
</head>
<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}
  <div class="{{ container_class }} {% block page_class %}{% endblock %} ">
    <div class="headband"></div>

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_third-party/duoshuo-hot-articles.swig' %}
          {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>
    <footer id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
        {% include '_third-party/analytics/analytics-with-widget.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>
    {% if not theme.sidebar.b2t %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {% if theme.sidebar.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {% endif %}
      </div>
    {% endif %}
  </div>
  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}
  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}
  {% block script_extra %}
    {% include '_scripts/pages/post-details.swig' %}
  {% endblock %}
  {% include '_scripts/boostrap.swig' %}
  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
  {% include '_third-party/analytics/index.swig' %}
  <!--音乐播放-->
  <link rel="stylesheet" href="/static/lib/QPlayer/css/player.css">
<div id="QPlayer">
<div id="pContent">
	<div id="player">
		<span class="cover"></span>
		<div class="ctrl">
			<div class="musicTag marquee">
				<strong>Title</strong>
				 <span> - </span>
				<span class="artist">Artist</span>
			</div>
			<div class="progress">
				<div class="timer left">0:00</div>
				<div class="contr">
					<div class="rewind icon"></div>
					<div class="playback icon"></div>
					<div class="fastforward icon"></div>
				</div>
				<div class="right">
					<div class="liebiao icon"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="ssBtn">
	        <div class="adf"></div>
    </div>
</div>
<ol id="playlist"></ol>
</div>
<script src="/static/lib/QPlayer/js/jquery.marquee.min.js"></script>
<script>
	var	playlist = [
	{title:"Luv Letter",artist:"DJ OKAWARI",mp3:"https://p2.music.126.net/hpNIN9n-_GeBCv0jMSIxww==/3172091046155063.mp3",cover:"https://p4.music.126.net/YXY1vPG5rtdV7w_cWDnNWw==/884007348732141.jpg?param=106x106",},
{title:"塞尔号",artist:"曾轶可",mp3:"{{ theme.ycw_resurl }}/static/music/music.mp3",ogg:"{{ theme.ycw_resurl }}/static/music/music.ogg",cover:"https://p4.music.126.net/7VJn16zrictuj5kdfW1qHA==/3264450024433083.jpg?param=106x106",},
{title:"贝加尔湖畔",artist:"李健",mp3:"https://p2.music.126.net/vXnnAZFGZ30g5eCK_ccnUA==/1207263767307060.mp3",cover:"https://p4.music.126.net/aSxiiy01L3Q35IqsaAUgvQ==/100055558133714.jpg?param=106x106",},
];
  var isRotate = true;
  var autoplay = true;
</script>
<script src="/static/lib/QPlayer/js/player.js"></script>
<!--音乐播放-->
</body>
</html>
