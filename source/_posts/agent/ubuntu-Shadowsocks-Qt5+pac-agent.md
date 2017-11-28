---
title: ubuntu下Shadowsocks-Qt5+pac实现代理
date: 2017-09-26 18:18:18
categories: 
 - agent
 - pac
tags: 
 - agent
 - pac-agent
---
本文描述了如何在ubuntu上如何使用pac代理，以及代理过程中遇到得各种问题．
1. #### 安装配置shadowsocks-Q5

   通过PPA源安装，仅支持Ubuntu 14.04或更高版本; 大家可以参考[官网github](https://github.com/shadowsocks/shadowsocks-qt5/wiki/%E5%AE%89%E8%A3%85%E6%8C%87%E5%8D%97)上更为详细的安装说明

   ```
   sudo add-apt-repository ppa:hzwhuang/ss-qt5
   sudo apt-get update
   sudo apt-get install shadowsocks-qt5
   ```

   安装过过程中可能会遇到各种依赖关系（大概两三个的样子），逐个解决就可以了．

   ![shadowsocks](https://res.ycwang.top/static/img/2017/shadowsocks.png)

2. #### 配置pac全局代理

   1、安装GenPAC  
   GenPAC 是基于gfwlist的代理自动配置（Proxy Auto-config）文件生成工具，支持自定义规则  
   大家可以参考[官网github](https://github.com/JinnLynn/GenPAC)  

   ```shell
   $ sudo pip install genpac
   $ pip install --upgrade genpac
   ```
   2、调用在线 [gfwlist](https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt) 列表生成本地 autoproxy.pac 文件  

   ```
   genpac --format=pac --pac-proxy="SOCKS5 127.0.0.1:1080" --gfwlist-local=~/gfwlist.txt --gfwlist-update-local

   genpac --format=pac --pac-proxy="SOCKS5 127.0.0.1:1080" --gfwlist-local=~/gfwlist.txt --gfwlist-update-local --output="~/autoproxy.pac"
   ```

   3、打开 设置-网络-代理中设置 ，把生成的pac文件设置进去，类型为自动就可以了．

3. #### 安装使用Proxychains解决终端代理

   至此已经可以正常使用代理了，然而ubuntu下我们会发现ping　google不通，其实Ubuntu所谓的系统代理是HTTP_PROXY, HTTPS_PROXY, SOCKS_PROXY 这几个系统环境变量,ping大概是属于bsdutils吧，而且ping走ICMP协议，自然儿然有些工具和软件就使用不了系统代理，大概是这个原理，所以我们引入了Proxychains代理终端，来让ubuntu下更好得翻墙．

   ```
   sudo apt-get install proxychains
   sudo vim /etc/proxychains.conf
   ```

   把里面的最后一行设置改为 socks5 127.0.0.1 1080 就好了。之后命令需要翻墙的时候，在前面加上proxychains 就行。如下：

   ```
   proxychains wget https://www.google.com.hk
   ```

   （如您在阅览过程中发现错误，还望大佬动动手指在下方留言，以免误导更多读者！）



