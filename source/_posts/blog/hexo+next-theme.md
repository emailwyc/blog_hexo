---
title: hexo+next主题+相册实现＋音乐插件＋留言等简单介绍
date: 2017-09-27 20:18:30
categories: 
 - blog
tags: 
 - blog
---
本文主要讲述github或coding下使用hexo框架搭建博客的过程介绍，以及框架或主题中添加相应插件，相册，音乐，留言等等;下面我们进入正题：
#### 一、介绍安装配置Hexo

##### 安装node模块

Hexo是一个快速、简洁且高效的博客框架。Hexo使用Markdown解析文章，在几秒内，即可利用靓丽的主题生成静态网页，那么如何进行安装呢？在安装之前首先确保我们得机器已经安装了node，nodejs安装过程在这里不再讲述每个系统安装方法雷同（注意安装版本不要过低），有些时候可能还需要翻墙进行依赖包得安装．我这里源码安装[github源码包](https://github.com/nodejs/node),（注意装好之后应该是最新版本，而非稳定版，我们需要全局安装n模块，使用n statble 升级到稳定版本）

```  
$ sudo npm install -g n
$ sudo n stable  
$ sudo npm install npm -g
```

另外附上npm几个常用命令

```
$ npm list               #列出已安装模块  
$ npm show express       #显示模块详情  
$ npm update             #升级当前目录下的项目的所有模块   
$ npm update express     #升级当前目录下的项目的指定模块  
$ npm update -g express  #升级全局安装的express模块   
$ npm uninstall express  #删除指定的模块
```

##### 安装配置hexo和next主题

```
$ npm install -g hexo-cli
```

这里是hexo最新版本，安装以前的的版本可以使用`$ npm install -g hexo`  
大家可以参考安装方法[官网](https://hexo.io)，里面包括主题，我这里使用得是next主题，安装方法和配置请参考[这里](http://theme-next.iissnan.com/)  
而部署到github或者coding都是可以的，或者两者都部署，域名解析得时候指向更改成不通得cname即可．我这里部署到了coding执行coding服务器国内ip,解析起来很快，大家不妨也用我的方法．
部署完那成之后可以在模板中根据需求更改型对应模板，关键是美观和速度吧．

相关配置和插件可以参考官网，这里还是主要说一下相册和音乐实现，留言模块我这里使用的是畅言（域名需要备案，我这里先用的其他网站，审核通过后改成自己得域名就可以了）



#### 二、相册实现机制

##### 

##### 新建页面

相册实现也是参考网上方法实现，这里只做一下标记，根据主题不通可能会有略微差别，比如查看图片插件，图片懒加载等．

`hexo new page "photo"`

执行上面命令，会在`source`文件夹中生成`photo`文件夹，打开`photo`文件夹中的`index.md`文件，修改内容如下：

```
    title: 相册
    noDate: 'true'
```

##### 模板修改

模板page.swig文件加入下面代码：

```
        {% elif page.type === 'photo' %}
<style>
.main-inner { margin-top: 10px !important;}
.wall {display: block;position: relative;margin-bottom:10px;overflow:hidden;margin-left: -1.5%;margin-right: -1.5%;padding-left:0px;}
.wall-column {display: block;position: relative;width: 25%;float: left;padding: 0 1.5%;box-sizing: border-box;}
.wall-li {display: block;margin: 0 0 8% 0;padding: 5%;background:rgba(255,255,255,0.7);border-radius: 3px;position:relative;box-shadow: 0px 0  0px rgba(0, 0, 0, 0.05);transition:all 0.2s;overflow: hidden;box-sizing:border-box;position: relative;border:1px solid rgba(0,0,0,0.1);}
.wall-li:hover{border:1px solid #ff4200;box-shadow:0 0 10px #555;}
.wall-li img {display: block;width: 100%;margin: 0 0 5% 0;} 
.wall-li p{ overflow: hidden; font-weight:bold;text-overflow: ellipsis; white-space: nowrap; width: 100%; font-size: 14px;padding-bottom:5px;margin-bottom: 5px; }
.wall-li small{ font-size:12px; color: #777; display:inline-block;line-height:15px;overflow: hidden;text-overflow: ellipsis; white-space: nowrap;}
.wall-li small:nth-of-type(1){float:left}
.wall-li small:nth-of-type(2){float:right}
.show-btn{width:100%;height:100%;background:rgba(0,0,0,0.8);overflow:hidden;position:absolute;left:0;top:0;transform:scale(0);-webkit-transform:scale(0);transition:all 0.3s ease;-webkit-transition:all 0.3s ease;}
.show-btn a{display:inline-block;width:50%;text-align:center;top:45%;font-size:30px;position:absolute;}
.show-btn a i{color:#fff;}
.show-pic:hover i,.show-info:hover i{color:#ff6700}
.wall-li:hover .show-btn{transform:scale(1);-webkit-transform:scale(1);}
.show-pic{left:0;}
.show-info{right:0;}
.img_loading{background:rgba(255,255,255,0.6) url(/images/myloading.gif) no-repeat center center;}
.img_loading img{    opacity: 0;} 
@media screen and (min-width:320px) and (max-width:768px){
    .wall-column{width:50%;}
    .wall-li p,.wall-li small{font-size:12px;padding:0;}
    .wall{margin-left:-1%;margin-right:-1%;}
    .header-inner {margin-bottom: 5px;}
}
</style>
<div class="instagram">
<ul class="wall baguetteBoxOne gallery img-box-ul" >
</ul>
</div>
```

_layout.swig文件加入一下内容：

```
114 <!--相册-->
115 {% if page.type === 'photo' %}
116 <script src="/static/lib/photo/jaliswall.js"></script>(图片墙插件)
117 <script src="/static/lib/photo/photo.js"></script>（图片处理）
118 {% endif %}
119 <!--相册-->
```

##### 生成html内容

photo.js文件内容如下：

```
  1 /**
  2  * Created by soone on 17-9-2.
  3  */
  4 var photojs={
  5     page: 1,
  6     offset: 20,
  7     init: function () {
  8         var that = this;
  9         var imgurl = "/photo/output.json";
 10         $.getJSON(imgurl, function (data) {
 11             that.render(that.page, data);
 12             that.scroll(data);
 13         });
 14     },
 15 
 16     render: function (page, data) {
 17         var begin = (page - 1) * this.offset;
 18         var end = page * this.offset;
 19         if (begin >= data.length) return;
 20         var html, li = "";
 21         for (var i = begin; i < end && i < data.length; i++) {
 22             var filename = data[i].substring(0,data[i].lastIndexOf("."));
 23             li += '<div class="wall-li">' +
 24                 '<a class="show-pic lightbox soone'+page+'" href="'+CONFIG.resurl+'/static/photo/' + data[i] + '?raw=true" title="'+filename+'" rel="group">' +
 25                 '<img class="img_loading" src="'+CONFIG.resurl+'/static/photo/' + data[i] + '?raw=true" title="'+filename+'" alt="'+filename+'">' +
 26                 '</a></div>';
 27         }
 28 
 29         $(".img-box-ul").append(li);
 30         $('.soone'+page).find('img').lazyload({
 31            // placeholder: '/images/loading.gif',
 32             effect: 'fadeIn'
 33         });
 34         NexT.utils.wrapImageWithFancyBox1('.soone'+page);
 35         //瀑布流start
 36         $('.wall').jaliswall({ item: '.wall-li' });
 37         //瀑布流end
 38         $(".img_loading").load(function(){
 39             $(this).removeClass("img_loading");
 40         });
 41     },
 42 
 43     scroll: function (data) {
 44         var that = this;
 45         $(window).scroll(function() {
 46             var windowPageYOffset = window.pageYOffset;
 47             var windowPageYOffsetAddHeight = windowPageYOffset + window.innerHeight;
 48             var sensitivity = 0;
 49 
 50             var offsetTop = $(".instagram").offset().top + $(".instagram").height();
 51 
 52             if (offsetTop >= windowPageYOffset && offsetTop < windowPageYOffsetAddHeight + sensitivity) {
 53                 that.render(++that.page, data);
 54             }
 55         })
 56     }
 57 }
 58 photojs.init();
 59 
```

​

相册的样式使用该主题作者的相册样式，如果大家使用其他主题，样式可以自己实现。

##### 图片位置

图片不能放在`source`文件中，因为需要编译成静态文件，非常慢，那放在哪好呢？一般我们会把博客备份到`github`，这样可以在不同电脑上写博客。那么我们也可以把相册一起上传到`github`，所以，在博客根目录下建一个放置图片的文件夹`photos`，这样你上传再多的图片都可以。

##### 获取图片

原生`js`不能很好的处理文件，所以用`js`并不能获取图片的文件名。虽然`js`不能处理文件，但是`nodejs`可以啊。在`source\photo`文件夹中新建一个`tool.js`文件，内容如下：

```
   /*
   "use strict";
    const fs = require("fs");
    const path = "../../photos";

    fs.readdir(path, function (err, files) {
        if (err) {
            return;
        }
        let arr = [];
        (function iterator(index) {
            if (index == files.length) {
                fs.writeFile("output.json", JSON.stringify(arr, null, "\t"));
                return;
            }

            fs.stat(path + "/" + files[index], function (err, stats) {
                if (err) {
                    return;
                }
                if (stats.isFile()) {
                    arr.push(files[index]);
                }
                iterator(index + 1);
            })
        }(0));
    });
    */
```

`tool.js`的作用是把所有的图片名称放在一个`json`文件中。运行`node tool.js`就会在`source\photo`下创建一个`output.json`文件。每次你要添加新图片时，都要运行`node tool.js`。

有了这个`json`文件，接下来就要用到`js`生成`html`代码了。

##### 生成静态文件

别忘了要在主题的配置文件`_config.yml`的`menu`下添加一个相册的菜单：

```
    menu:
      首页: /
      归档: /archives
      随笔: /tags/随笔
      相册: photo
```

最后运行`hexo g`生成静态文件。就可以在本地查看或者上传`github`查看相册功能了。

#### 三、音乐插件实现

音乐插件可以使用html5　audio自己去写(试过了，但是感觉放在coding上面不太合适，原因不得而知)，自己写想实现切换页面音乐不中断不考虑seo得话可以使用iframe标签实现．当然也可以自己记录播放时间记录到客户端切换页面得时候再从记录得时间开始播放就可以了，我这里使用得也是这个逻辑，大家不妨也试试．

下面说一下Qplayer插件，[这里下载](https://github.com/Jrohy/QPlayer)

大家下载配置就行了．

#### 四、关于algolia插件问题和问题补充

有时候我们使用algolia时，执行hexo algolia时会失败，有可能是因为content内容格式问题造成，我这里直接去掉了content字段，因为内容在搜索中没有太大用处，解析和上传速度也变得比较慢，可以打开node_modules/hexo-algolia/lib/command.js做相应修改也可以．

 mac 下安装完hexo,执行hexo命令发现: 

```
[soone] ~/blog_hexo $ hexo clean
{ Error: Cannot find module './build/Release/DTraceProviderBindings'
    at Function.Module._resolveFilename (module.js:485:15)
    at Function.Module._load (module.js:437:25)
    at Module.require (module.js:513:17)
```

但是这个错误不会影响正常的运行,但对于强迫症来说，这是无法忍受 的

```
npm install hexo --no-optional --save
```

如果发现还是不行的话,检查一下是否运行的是项目中的包,,我们删除项目中的hexo 包,改装成全局的应该就可以了.
