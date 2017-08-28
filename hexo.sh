#! /bin/sh
### BEGIN INIT INFO
#  shell run hexo
### END INIT INFO
#pkill hexo 
hexo clean
nohup hexo g -w  > ~/hexo_watch.log 2>&1 &
nohup hexo s > ~/hexo_watch.log 2>&1 &
#nohup hexo s > ~/hexo.log 2>&1 &
