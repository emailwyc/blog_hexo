#! /bin/sh
### BEGIN INIT INFO
#  shell run hexo
### END INIT INFO
cd attachment
git pull
git add .
git ci -am "change"
git push
cd ..
git pull
git add .
git ci -am "change"
git push
#nohup hexo s > ~/hexo.log 2>&1 &
