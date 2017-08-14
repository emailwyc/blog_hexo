<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.authoricon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

{% if theme.copyright %}
<div class="powered-by">
版权所有:倡导开源,支持原创,本博客需合法转载(注明来源)!
</div>

<div class="theme-info">
<p>Hosted by <a href="https://pages.coding.me" style="font-weight: bold">Coding Pages</a>
&npsp;&npsp;&npsp;|&npsp;&npsp;&npsp;
<a href="/sitemap.xml">网站地图</a>
</p>
</div>
{% endif %}
