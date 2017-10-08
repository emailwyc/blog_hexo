---
title: ubuntu安装openssh-server后没有启动，ssh登录失败（彻底卸载软件）
date: 2017-10-08 21:06:31
categories: 
 - ubuntu 
tags: 
 - ubuntu
---

前些阵子使用笔记本ssh连接我的PC电脑时发现ssh服务拒绝连接！ps查看进程后发现openssh-server没有启动，可是明明安装了的，于是卸载后发现还是不行，发现原来的配置没有变化，只好彻底卸载重装后这才可以！

#### 1、查看是否启动

```
ps -ef|grep ssh
```

#### 2、彻底卸载openssh-sever ,然后重装

```
sudo apt-get remove --purge openssh-server
sudo apt-get install openssh-server
ps -ef|grep ssh
```

sshd正常启动