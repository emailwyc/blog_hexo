{% if page.comments %}
  <div class="comments" id="comments">
    {% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}
      <div class="ds-thread" data-thread-key="{{ page.path }}"
           data-title="{{ page.title }}" data-url="{{ page.permalink }}">
      </div>
    {% elseif theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}
      <div class="fb-comments"
           data-href="{{ page.permalink }}"
           data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
           data-width="{{ theme.facebook_comments_plugin.width }}"
           data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
      </div>
    {% elseif theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
      <div id="vk_comments"></div>
    {% elseif theme.disqus.enable %}
      <div id="disqus_thread">
        <noscript>
          Please enable JavaScript to view the
          <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a>
        </noscript>
      </div>
    {% elseif theme.hypercomments_id %}
      <div id="hypercomments_widget"></div>
    {% elseif theme.youyan_uid %}
      <div id="uyan_frame"></div>
    {% elseif theme.wumicomment %}
		<script type="text/javascript" id="wumiiComments">
			var wumiiPermaLink = ""; //请用代码生成文章永久的链接
			var wumiiTitle = ""; //请用代码生成文章标题
			var wumiiSitePrefix = ""; //安装无觅评论插件的网站的域名，如果是放在子域名上，请提供子域名，如"http://blog.wumii.com"。如果这里填写的域名不对，请自行改正。
			var wumiiCommentParams = "&pf=JAVASCRIPT";
		</script>
		<script type="text/javascript" src="/js/src/wumi.js"></script>
    {% elseif theme.livere_uid %}
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    {% elseif theme.changyan.appid and theme.changyan.appkey %}
      <div id="SOHUCS"></div>
    {% endif %}
  </div>
{% endif %}
