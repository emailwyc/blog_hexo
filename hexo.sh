#! /bin/sh
### BEGIN INIT INFO
#  shell run hexo
### END INIT INFO
cd $1
hexo clean
nohup hexo g -w  > ~/hexo_watch.log 2>&1 &
pkill hexo 
nohup hexo s > ~/hexo.log 2>&1 &
