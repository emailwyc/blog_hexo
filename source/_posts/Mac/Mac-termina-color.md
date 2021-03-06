---
title: Mac下终端简单配色
date: 2017-10-02 18:29:10
categories: 
 - Mac
tags: 
 - Mac
 - termina
---
家里的Mac mini搁置了很长时间,这次十一放假恰巧碰到公司一些紧急的任务需要处理,处理完之后,把终端做了简单配置,这里只做记录:
#### 一、终端(termina)ls 配色

打开.bash_profile文件，配置如下：

```
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
alias ls="ls -G"
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
export PS1='[\[\e[01;31m\]\u\[\e[00m\]] \w \$ '
```

配置完成后可以使用source命令来使时时生效

![如图](https://res.ycwang.top/static/img/2017/mac-termina-ls.png)

#### 二、vim简单配置

打开.vimrc文件，配置如下：

```
filetype on
set history=9999
#set background=dark
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set nohls
set incsearch
set backup
```

我这里只是简单用，大家如果开发经常用的话可以根据不同语言加入一些自动补全插件和一些窗口或更高级的配置来满足自己的需求；

![如图](https://res.ycwang.top/static/img/2017/mac-termina-vim.png)



> 引自cnblogs，如有侵权行为，请及时通知！

下面随便从google上搜到摘抄过来的文章，仅供大家参考：

# 将vim打造成IDE开发环境

本文主要介绍将vim打造成IDE开发环境，如代码补全，高亮显示，函数跳转，函数自动注释等

> 首先介绍2款VIM插件管理器：Vbundle,Pathogen

本文中的vim插件，都可以通过这2款插件管理软件进行安装。具体使用方法，请参考官方说明
下面主要介绍通过手动安装的方式，安装VIM插件。

## 一.高亮显示

具体请参考vim配置说明

## 二.代码自动补全插件neocomplete

使用该插件，需要vim+lua支持，具体配置方法请参考lua安装

neocomplete安装,以下是github地址

```
https://github.com/Shougo/neocomplete
```

**步骤1**:下载插件

```
git clone https://github.com/Shougo/neocomplete
```

**步骤2**:安插neocomplete
将下载的源码复制到vim目录

```
cd neocomplete
cp -r autoload doc plugin /usr/share/vim/vim74/
```

**步骤3**:配置vimrc,使其支持自动补全
neocomplete配置，在/etc/vimrc (/usr/share/vim/vimrc)中加入如下配置

```
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
```

**步骤4**:php自动补全配置

经过以上配置，默认情况下已经支持大多数语言的代码补全
官方已经禁用了php和ruby的代码补全，因为运行效率太慢
要使用php补全，参考https://github.com/shawncplus/phpcomplete.vim说明

```
Q: I want to use PHP omni completion.

A:
Note: You should use this omni completion for PHP.
https://github.com/shawncplus/phpcomplete.vim
>
    let g:neocomplete#sources#omni#input_patterns.php =
    \ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
<

```

在这里，直接在vimrc中加入如下配置，就可以php自动补全了

```
let g:neocomplete#sources#omni#input_patterns.php =
    \ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
```

------

如果要使用neocomplete推荐的php补全，[https://github.com/shawncplus/phpcomplete.vim，请参考如下配置](https://github.com/shawncplus/phpcomplete.vim%EF%BC%8C%E8%AF%B7%E5%8F%82%E8%80%83%E5%A6%82%E4%B8%8B%E9%85%8D%E7%BD%AE)

需要安装Vbundle,它是一个vim软件集，且是一个vim插件管理器

```
https://github.com/VundleVim/Vundle.vim
```

```
步骤1
在vim路径，/usr/share/vim/vim74/ 下建立bundle目录
 cd ~/.vim/bundle
 git clone git://github.com/shawncplus/phpcomplete.vim.git
 
 步骤2：
git clone https://github.com/VundleVim/Vundle.vim.git

在vimrc最开始加入如下配置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

输入如下命令运行安装插件
:PluginInstall
或者
sh执行vim +PluginInstall +qall

.vimrc加入如下配置 
Plugin 'shawncplus/phpcomplete.vim'
Source your .vimrc with :so % or otherwise reload your vim
Run the :PluginInstall commmand


```

## 三.函数,文件自动注释插件 DoxygenToolkit.vim

```
http://www.vim.org/scripts/script.php?script_id=987
https://github.com/vim-scripts/DoxygenToolkit.vim

安装插件 
Copy to your '~/.vim/plugin' directory
cp -r plugin /usr/shar/vim/vim74/


let g:DoxygenToolkit_commentType = "php"
let g:DoxygenToolkit_authorName="coolbaby"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

let g:DoxygenToolkit_briefTag_pre="@desc function  "
let g:DoxygenToolkit_paramTag_pre="@params [type] "
let g:DoxygenToolkit_returnTag="@return "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
"let g:DoxygenToolkit_authorName="Mathias Lorente"
"let g:DoxygenToolkit_licenseTag="My own license"
```

doxygen使用

注释操作都在vim命令行模式下操作：

1 注释类型（C/C++/// 或者, Python：##和#）：
在vim中，默认C++注释为，但是如果你更喜欢使用///，只需要在你的配置文件.
vimrc中添加如下语句：
let g:DoxygenToolkit_commentType="C++"。

2 许可：
在vim中，将光标放在将要写doxygen许可注释的那一行，然后，执行命令`:DoxLic`。这将会生成许可注释并将光标放置在刚才那一行之后。

3 作者：

在vim中，将光标放在想要添加doxygen作者注释的地方。然后执行命令`:DoxAuthor`。这将会生成一个框架，[如果没有为其设置变量则将光标放置在@author标签之后](mailto:%E5%A6%82%E6%9E%9C%E6%B2%A1%E6%9C%89%E4%B8%BA%E5%85%B6%E8%AE%BE%E7%BD%AE%E5%8F%98%E9%87%8F%E5%88%99%E5%B0%86%E5%85%89%E6%A0%87%E6%94%BE%E7%BD%AE%E5%9C%A8@author%E6%A0%87%E7%AD%BE%E4%B9%8B%E5%90%8E)，或者放在在框架之后。

4 函数/类注释：
在vim中，将光标放置在函数头部那一行（或者函数的返回变量）或者类。然后执行命令`:Dox`。[这将生成框架并且将光标放置在@brief标签后](mailto:%E8%BF%99%E5%B0%86%E7%94%9F%E6%88%90%E6%A1%86%E6%9E%B6%E5%B9%B6%E4%B8%94%E5%B0%86%E5%85%89%E6%A0%87%E6%94%BE%E7%BD%AE%E5%9C%A8@brief%E6%A0%87%E7%AD%BE%E5%90%8E)。

5 忽略代码片段（只有C/C++）：
在vim中，如果你想要忽略所有在块中的代码片段，类似： #ifdef DEBUG ... #endif你只需要执行以下命令`:DoxUndoc`(DEBUG)!

6 组：
在vim中，执行命令`:DoxBlock`在后面的行中插入一个doxygen块。

## 四.ctags,标签Taglist

taglist是一个用于显示定位程序中各种符号的插件，例如宏定义、变量名、结构名、函数名这些东西 我们将其称之为符号(symbols)，而在taglist中将其称之为tag。

显然，要想将程序文件中的tag显示出来，需要事先了解全部tag的信息，并将其保存在一个文件中，然后去解析对应的tag文件。

taglist做的仅仅是将tag文件中的内容解析完后显示在Vim上而已。

tag扫描以及数 据文件的生成则是由ctags(Exuberant Ctags)这一工具完成的

所以在使用taglist之前，你的电脑需要装有ctags。

### 1)、vim插件tags安装与配置

ctags可以建立源码树的标签索引（标签就是一个标识符被定义的地方，如函数定义），使程序员在编程时能迅速定位函数、变量、宏定义等位置去查看原形

Ctags工具是用来遍历源代码文件生成tags文件，这些tags文件能被编辑器或其它工具用来快速查找定位源代码中的符号（tag/symbol），如变量名，函数名等。比如，tags文件就是Taglist和OmniCppComplete工作的基础。

以下是在centos6.7下ctags的下载安装和配置过程：

参考资料

```
https://github.com/shawncplus/phpcomplete.vim/wiki/Patched-ctags
http://blog.csdn.net/duguteng/article/details/7412652
```

ctags相关网站

```
http://ctags.sourceforge.net/
当前的PHP支持ctags发布(5.8)不支持当前的PHP版本的新功能名称空间、特征或旧功能接口。
有一个改进版的https://ctags.io/
改进版ctags源码下载
https://github.com/shawncplus/phpcomplete.vim/raw/master/misc/ctags-5.8_better_php_parser.tar.gz
```

ctags安装

```
wget "https://github.com/shawncplus/phpcomplete.vim/raw/master/misc/ctags-5.8_better_php_parser.tar.gz" -O ctags-5.8_better_php_parser.tar.gz
tar xvf ctags-5.8_better_php_parser.tar.gz
./configure
make
make install

运行
ctags --version 将会看到 Exuberant Ctags Development表示安装成功
```

使用ctags

```
cd /path/to/your/projects/root
运行
ctags -R --fields=+aimS --languages=php
参数说明

    -a
    Access (or export) of class members; Adds the access field like: access: public

    -i
    Inheritance information; Adds the inherits field like: inherits:RuntimeException,ExceptionInterface

    -m
    Implementation information; Adds the implementation field like: implementation:abstract

    -S
    Signature of routine; Adds the signature field like: signature:($a, $b)

These extra fields will show up in the tag stack like this:
使用额外的参数字段将会看到类似下面的堆栈调试信息

6 F   f    handle            vendor/monolog/monolog/src/Monolog/Handler/NullHandler.php
             class:Monolog\Handler::NullHandler access:public signature:(array $record)
             public function handle(array $record)


```

### 2)、taglist

Taglist用于列出了当前文件中的所有标签（宏, 全局变量, 函数名等）

**安装Taglist**

```
方式1：vim-addons install taglist
方式2：
官网http://vim-taglist.sourceforge.net/
https://sourceforge.net/projects/vim-taglist/files/
https://sourceforge.net/projects/vim-taglist/files/vim-taglist/4.6/taglist_46.zip
taglist的github地址
https://github.com/vim-scripts/taglist.vim
目前最新版本是4.6
下载之后解压，拷备目录中的2个目录到vim目录
cp -r doc plugin /usr/share/vim/vim74/
```

**配置Taglist**

在Vim配置文件中，可通过"let"语句设定以下变量控制taglist：

```
Tlist_GainFocus_On_ToggleOpen : 为1则使用TlistToggle打开标签列表窗口后会获焦点至于标签列表窗口；为0则taglist打开后焦点仍保持在代码窗口
Tlist_Auto_Open : 为1则Vim启动后自动打开标签列表窗口
Tlist_Close_On_Select : 选择标签或文件后是否自动关闭标签列表窗口
Tlist_Exit_OnlyWindow : Vim当前仅打开标签列表窗口时，是否自动退出Vim
Tlist_Use_SingleClick : 是否将默认双击标答打开定义的方式更改为单击后打开标签
Tlist_Auto_Highlight_Tag : 是否高亮显示当前标签。命令":TlistHighlightTag"也可达到同样效果
Tlist_Highlight_Tag_On_BufEnter : 默认情况下，Vim打开/切换至一个新的缓冲区/文件后，标签列表窗口会自动将当前代码窗口对应的标签高亮显示。TlistHighlight_Tag_On_BufEnter置为0可禁止以上行为
Tlist_Process_File_Always : 为1则即使标签列表窗口未打开，taglist仍然会在后台处理vim所打开文件的标签
Tlist_Auto_Update : 打开/禁止taglist在打开新文件或修改文件后自动更新标签。禁止自动更新后，taglist仅在使用:TlistUpdate,:TlistAddFiles，或:TlistAddFilesRecursive命令后更新标签
Tlist_File_Fold_Auto_Close : 自动关闭标签列表窗口中非激活文件/缓冲区所在文档标签树，仅显示当前缓冲区标签树
Tlist_Sort_Type : 标签排序依据，可以为"name"（按标签名排序）或"order"（按标签在文件中出现的顺序，默认值）
Tlist_Use_Horiz_Window : 标签列表窗口使用水平分割样式
Tlist_Use_Right_Window : 标签列表窗口显示在右侧（使用垂直分割样式时）
Tlist_WinWidth : 设定水平分割时标签列表窗口的宽度
Tlist_WinHeight : 设定垂直分割时标签列表窗口的高度
Tlist_Inc_Winwidth : 显示标签列表窗口时允许/禁止扩展Vim窗口宽度
Tlist_Compact_Format : 减少标签列表窗口中的空白行
Tlist_Enable_Fold_Column : 是否不显示Vim目录列
Tlist_Display_Prototype : 是否在标签列表窗口用标签原型替代标签名
Tlist_Display_Tag_Scope : 在标签名后是否显示标签有效范围
Tlist_Show_Menu : 在图型界面Vim中，是否以下拉菜单方式显示当前文件中的标签
Tlist_Max_Submenu_Item : 子菜单项上限值。如子菜单项超出此上限将会被分隔到多个子菜单中。缺省值为25
Tlist_Max_Tag_Length : 标签菜单中标签长度上限
```

在vim配置文件/home/user/.vimrc中加入如下的配置：

```
"-- Taglist setting --
"自动更新taglist
let Tlist_Auto_Update = 1
"设置taglist宽度
let Tlist_WinWidth=40       
"因为我们放在环境变量里，所以可以直接执行
let Tlist_Ctags_Cmd='ctags' 
"让窗口显示在右边，0的话就是显示在左边
let Tlist_Use_Right_Window=1 
"让taglist可以同时展示多个文件的函数列表
let Tlist_Show_One_File=0 
"非当前文件，函数列表折叠隐藏
let Tlist_File_Fold_Auto_Close=1 
 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Exit_OnlyWindow=1
"为1则即使标签列表窗口未打开，taglist仍然会在后台处理vim所打开文件的标签
let Tlist_Process_File_Always=1 
let Tlist_Inc_Winwidth=0
```

**标签列表窗口快捷键**

taglist快捷键：

```
<CR> : 代码窗口跳转到标签列表窗口中光标所在标签定义处
o : 在新建代码窗口中跳转到标签列表窗口中光标所在标签定义处
P : 跳转至上一个窗口的标签处
p : 代码窗口中内容跳转至标签定义处，光标保持在标签列表窗口中
t : 在Vim新标签窗口中跳转至标签定义处。如文件已经在Vim标签窗口中打开，则跳转至此标签窗口
Ctrl-t : 在Vim新标签窗口处跳转至标签定义处
 : 显示光标当前所在标签原型。对文件标签，显示文件的全路径名，文件类型和标签数量。对标签类型(指如variable/function等类别)，显示标签类型和拥有标签的数量;对函数/变量等普通标签，显示其定义的原型
u : 更新标签列表窗口中的标签信息
s : 切换标签排序类型(按名称序或出现顺序)
d : 移除当前标签所在文件的所有标签
x : 扩展/收缩标签列表窗口
+ : 展开折叠节点*
- : 折叠结点*
* : 展开所有结点
= : 折叠所有节点
[[ : 跳转至上一个文件标签的头部
<Backspace> : 跳转至上一个文件标签头部
]] : 跳转至下一个文件标签头部
<Tab> : 跳转至下一个文件标签头部
q : 关闭标签列表窗口
F1 : 显示帮助**
```

**taglist命令**

taglist在Vim中提供了以下扩展命令:

```
:TlistAddFiles {files(s)} [file(s)...] 添加一或多个指定文件(的标签项)到标签列表窗口中。文件名表达式中可使用通配符(*);如文件名中带有空格，需要使用反斜杠对空格进行转义("\ ")
:TlistAddFilesRecursive {directory} [{pattern}] 遍历指定路径{directory}，将与模式{pattern}相匹配的文件加入标签列表窗口。如未指定pattern，则使用缺省值'*'。如路径中包含空格，需使用反斜杠'\'转义("\ ")
:TlistClose 关闭标签列表窗口
:TlistDebug [filename] 记录taglist插件的调试信息。如指定了filename，则调试信息将被写入此指定文件（如文件已存在，内容将被覆盖)；如未指定filename，则调试信息写入脚本的局部变量中
:TlistLock 锁定标签列表，并且不处理新打开的文件
:TlistMessage 仅当调试信息写入脚本局部变量时有效，显示记录的调试信息
:TlistOpen 打开并跳转至标签列表窗口
:TlistSessionSave {filename} 将当前打开文件及其标签信息写入指定文件
:TlistSessionLoad {filename} 从指定文件载入所保存的会话信息
:TlistShowPrototype [filename] [linenumber] 显示指定文件中指定代码行或之前的标签的原型。如未指定文件名/行号，则使用当前文件名/当前行号
:TlistShowTag [filename] [linenumber] 显示指定文件中指定代码行或之前标签名称。如未指定文件名/行号，则使用当前文件名/当前行号
:TlistHighlightTag 加亮显示标签窗口中的当前标签
:TlistToggle 在打开和关闭状态间切换标签窗口的状态。标签窗口切换至打开状态后仍然光标保持在代码窗口中
:TlistUndebug 停止记录taglist插件调试信息
:TlistUnlock 解锁标签列表，并处理新打开的文件
:TlistUpdate 更新当前缓冲区的标签信息
```

**taglist全局函数**

taglist插件为Vim提供了一些全局函数，可供其他插件使用:

```
Tlist_Update_File_Tags({filename}, {filetype}) 以指定文件类型更新指定文件的标签信息。如taglist插件此前未处理过指定文件，则会调用ctags对文件进行分析
Tlist_Get_Tag_Prototype_By_Line([{filename}, {linenumber}]) 获取指定文件中指定行号或之前标签的原型信息。如未指定文件名/行号，则使用当前缓冲区对应文件/当前行号
Tlist_Get_Tagname_By_Line ([{filename}, {linenumber}]) 获取指定文件中指定行号或之前标签的名称信息。如未指定文件名/行号，则使用当前缓冲区对应文件/当前行号
Tlist_Set_App({appname}) 设置正在控制taglist的插件名称
```

**使用方法：**
[http://blog.csdn.net/skyflying2012/article/details/8112144参考](http://blog.csdn.net/skyflying2012/article/details/8112144%E5%8F%82%E8%80%83)

在源码目录下，执行`ctags -R`对各目录递归创建生成tags文件

用Vim打开源码文件，以命令模式执行`Tlist`，即可启用Taglist插件，可以查看taglist的帮助信息

`:TlistToggle`可以关闭，打开taglist
使用键映射关闭打开

```
nnoremap <silent> <F8> :TlistToggle<CR>
```

在Vim中加载代码文件后，可以使用以下命令控制taglist

```
:TlistOpen 打开并将输入焦点至于标签列表窗口
:TlistClose 关闭标签列表窗口
:TlistToggle 切换标签列表窗口状态(打开←→关闭)，标签列表窗口是否获得焦点取决于其他配置
ctl-w ＋ w 或ctl-w ＋ 方向键 窗口切换（taglist本质上是一个vim分隔窗口，因此可以使用ctl-w系列快捷键对窗口进行切换操作)
使用鼠标单击切换当前窗口，或在标签列表窗口某标签上双击使代码窗口内窗跳转至标签定义
标签列表窗口内，当光标停留在某个标签之上时，回车键可切换代码窗口内容至标签定义; 'o',在分隔窗口中显示;'t',在vim新标签窗口中显示
```

官方使用手册
<http://vim-taglist.sourceforge.net/manual.html>

进入vim后用命令":Tlist"打开/关闭taglist窗口
帮助文档
:help taglist.txt

## 五.代码折叠

折叠用于把缓冲区内某一范围内的文本行显示为屏幕上的一行。就像一张纸，要它缩短
些，可以把它折叠起来:

```
 +------------------------+
 | 行 1                   |
 | 行 2                   |
 | 行 3                   |
 |_______________________ |
 \                        \
  \________________________\
  / 被折叠的行             /
 /________________________/
 | 行 12                  |
 | 行 13                  |
 | 行 14                  |
 +------------------------+
```

那些文本仍然在缓冲区内而没有改变。受到折叠影响的只是文本行显示的方式。

折叠的好处是，通过把多行的一节折叠成带有折叠提示的一行，会使你更好地了解对文本
的宏观结构。

**折叠方式foldmethod**

vim提供以下6种方法来选定折叠方式：

```
manual 手工定义折叠
indent 更多的缩进表示更高级别的折叠
expr 用表达式来定义折叠
syntax 用语法高亮来定义折叠
diff 对没有更改的文本进行折叠
marker 对文中的标志折叠
```

**折叠级别foldlevel**

'foldlevel' 是个数值选项：数字越大则打开的折叠更多。

当 'foldlevel' 为 0 时，所有的折叠关闭。

当 'foldlevel' 为正数时，一些折叠关闭。

当 'foldlevel' 很大时，所有的折叠打开。

**折叠栏foldcolumn**

'foldcolumn' 是个数字，它设定了在窗口的边上表示折叠的栏的宽度。当为0时，没有折叠栏。最大是12。

一个打开的折叠由一栏来表示，顶端是 '-'，其下方是 '|'。这栏在折叠结束的地方结束。当折叠嵌套时，嵌套的折叠出现在被包含的折叠右方一个字符位置。

一个关闭的折叠由 '+' 表示。

当折叠栏太窄而不能显示所有折叠时，显示一数字来表示嵌套的级别。

在折叠栏点击鼠标，可以打开和关闭折叠：

点击 '+' 打开在这行的关闭折叠

在任何其他非空字符上点击，关闭这行上的打开折叠

在vim配置文件/home/user/.vimrc中加入如下的配置：

```
 "--fold setting vim折叠设置--

 " 用缩进来定义折叠
 set foldmethod=indext
 " 启动vim时不要自动折叠代码
 set foldlevel=100  
 " 设置折叠栏宽度
 set foldcolumn=5                            
```

常用命令

```
za  打开/关闭在光标下的折叠
zA  循环地打开/关闭光标下的折叠
zo  打开 (open) 在光标下的折叠
zO  循环打开 (Open) 光标下的折叠
zc  关闭 (close) 在光标下的折叠
zC  循环关闭 (Close) 在光标下的所有折叠
zM  关闭所有折叠
zR  打开所有的折叠
帮助文档
:help usr_28.txt
:help fold.txt
```

参考资料
<http://www.cnblogs.com/zhangsf/archive/2013/06/13/3134409.html>

## 六、vim语法检查插件syntastic

github地址

```
https://github.com/scrooloose/syntastic
```

**环境需求**

需要vim支持autocmd, eval, file_in_path, modify_fname, quickfix, reltime, and user_commands
检查以上vim依赖是否安装，出现+表示满足要求

```
vim --version |grep autocmd
```

这个插件是用来做静态语法检查的，支持多语言，比如 Ruby，Python 和 JavaScript 等。实际上这个插件是个接口，背后的语法检查是交给各个语言自己的检查器，Ruby 实际使用ruby -c命令，JavaScript 使用 jshint，jslint 等。

注意安装后jshint需要在系统环境变量中，否则需要指定path：
g:syntastic_jshint_exec
指定jshint的配置文件目录：
g:syntastic_javascript_jshint_conf

最后但并非最不重要的：syntastic不知道如何自己做任何语法检查。为了得到有意义的结果，你需要安装相应的文件外部检查你使用的类型

**安装syntastic with Pathogen**

1.需要先安装Pathogen

```
https://github.com/tpope/vim-pathogen
git clone https://github.com/tpope/vim-pathogen
cd vim-pathogen
cp -r autoload /usr/share/vim/vim74/
```

> 在vimrc中加入配置

```
execute pathogen#infect()
```

2.安装syntastic

```
mkdir -p /usr/share/vim/vim74/bundle
cd /usr/share/vim/vim74/bundle
git clone https://github.com/scrooloose/syntastic.git
```

3.推荐配置syntastic

```
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = 'err!'
let g:syntastic_warning_symbol = '!'

nmap <A-up> :lprev<cr>
nmap <A-down> :lnext<cr>
nmap <A-right> :ll<cr>
```

4.安装php语法分析器phpcs

```
方式1
pear install PHP_CodeSniffer
方式2
composer global require "squizlabs/php_codesniffer=*"
```

vim帮助文档`:help syntastic`

## 七、目录管理工具NERDtree

**安装方式**
用插件管理器pathogen.vim或者Vundle安装

```
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
```

启动vim，自动打开NERDtree

```
autocmd vimenter * NERDTree
```

How can I open a NERDTree automatically when vim starts up if no files were specified?

```
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
```

映射快捷键

```
map <C-n> :NERDTreeToggle<CR>
```

如果只剩下NERDTree最后一个窗口，如何关闭NERDTree

```
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
```

Can I have different highlighting for different file extensions?
不同的扩展名，显示不同的颜色

```
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
```

How can I change default arrows?
改变默认的箭头

```
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
```

<http://vim.wikia.com/wiki/Understanding_VIMRUNTIME>
