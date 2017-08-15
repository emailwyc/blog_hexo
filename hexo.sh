#! /bin/sh
### BEGIN INIT INFO
#  shell run hexo
### END INIT INFO
cd /home/soone/phpstorm/blog_hexo
hexo clean
nohup hexo g -w  > ~/hexo_watch.log 2>&1 &
pkill hexo 
nohup hexo s > ~/hexo.log 2>&1 &
