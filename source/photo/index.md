---
title: 相册
noDate: 'true'
---
<link href="/lib/fancybox/source/jquery.fancybox.css?v=2.1.5" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="https://res.ycwang.top/static/photo/js/photo.js"></script>
<script>
if($(".instagram").length) {
	require(['https://res.ycwang.top/static/photo/js/photo.js'], function(obj) {
		obj.init();
	});
}
</script>
<div class="instagram">
	<section class="archives album">
		<ul class="img-box-ul"></ul>
	</section>
</div>
