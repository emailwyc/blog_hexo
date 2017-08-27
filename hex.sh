#! /bin/sh
### BEGIN INIT INFO
#  shell run hexo
### END INIT INFO
#cd $1
#pkill hexo 
hexo clean
hexo g
hexo s
#nohup hexo s > ~/hexo.log 2>&1 &
