---
title: Mac手动清理缓存文件及内存方法
date: 2017-10-03 20:40:01
categories: 
 - Mac
tags: 
 - Mac
---

#### 一、手动清理程序缓存文件

我们平时在使用Mac系统时程序会留下缓存文件，缓存文件的累积会越来越多，即影响速度又占用空间；  
`缓存文件夹：~/Library/Caches/`  
`我们按照名称把不常用的手动清理掉即可。（在Caches文件夹的时候，点击上方菜单的：显示—查看显示选项（或者Command+J）-在这里面把“计算所有大小”的对号点上就可以查看每个文件夹占用的大小）`

#### 二、更多关于释放Mac硬盘空间方法

##### 1：禁用SafeSleep休眠模式（这种休眠模式当Mac休眠或者没电池时会将内存中的内容储存在硬盘上的sleepimage文件上）——能节省出4GB-16GB空间

```
sudo pmset -a hibernatemode 0  (禁用safeSleep模式)
cd /private/var/vm/
sudo rm sleepimage      (删除已经存在的sleepimage文件)
touch sleepimage
chmod 000 /private/var/vm/sleepimage(进一步防止系统自动创建该文件)

开启SafeSleep模式：
sudo pmset -a hibernatemode 3
sudo rm /private/var/vm/sleepimage
```

##### 2：移除系统语音文件——可以节省出500MB-3GB+硬盘空间

```
cd /System/Library/Speech/
sudo rm -rf Voices/*
(注：如果你执行了命令，那么你将无法使用系统的文字转语音功能)
```

##### 3：删除所有系统日志——可以节省出100MB-2GB硬盘空间

随着你使用Mac的时间越来越长，系统日志文件也会越来越多，根据电脑的用量、错误和服务，这些文件会越来越多。如果没用的话，我们就可以进行删除。

```
sudo rm -rf /private/var/log/*
（注：删除了系统日志，导致本地apache服务器挂掉，严重影响工作~~~解决：在/private/var/log下新建一个apache2的空文件夹）
```

##### 4：删除快速查看生成的缓存文件——可以节省出100MB-300MB硬盘空间

```
sudo rm -rf /private/var/folders/
```

##### 5：删除Emacs——可以节省出60MB+的硬盘空间

```
sudo rm -rf /usr/share/emacs/
(注：不常用的话，我们就可以进行删除)
```

##### 6：删除临时文件——可以节省500MB-5GB硬盘空间

```
cd /private/var/tmp/
rm -rf TM*
```

#### 三、释放Mac电脑内存空间方法

##### 1：删除临时文件——可以节省500MB-5GB硬盘空间

```
运行终端（Terminal），输入并执行命令：sudo purge
(使用purge 命令的原理是强制清空磁盘和内存的缓存，提供一个类似于系统刚刚重启后被称为cold disk buffer cache的内存状态。当然，使用purge 命令要优于重启系统的一点是在保持现有工作状态的前提下释放内存空间。)
```

##### 2：通过活动监视器手动清理内存

打开活动监视器窗口进行手动清理不使用的内存。



###### （另外：如果大家觉得操作以上这些太麻烦的话，自己可以下载一些清理内存、缓存这类的软件程序，应该会有很多吧；这个看个人喜好了）

​							——本文内容部分方法摘自互联网！