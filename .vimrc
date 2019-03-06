" =============================================================================
" File Name: .vimrc
" Author: Elvis
" Description: Vim配置文档
" Date: 2018.9.23
" =============================================================================

" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" =============================================================================
"                          << 以下为软件默认配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Windows Gvim 默认配置> 做了一点修改
" -----------------------------------------------------------------------------
if (g:iswindows && g:isGUI)
    "source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/mswin.vim
    "behave mswin
    set diffexpr=MyDiff()

    function! MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

" -----------------------------------------------------------------------------
"  < Linux Gvim/Vim 默认配置> 做了一点修改
" -----------------------------------------------------------------------------
if g:islinux
    set hlsearch        "高亮搜索
    set incsearch       "在输入要搜索的文字时，实时匹配

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    if g:isGUI
        " Source a global configuration file if available
        if filereadable("/etc/vim/gvimrc.local")
            source /etc/vim/gvimrc.local
        endif
    else
        " This line should not be removed as it ensures that various options are
        " properly set to work with the Vim-related packages available in Debian.
        runtime! debian.vim

        " Vim5 and later versions support syntax highlighting. Uncommenting the next
        " line enables syntax highlighting by default.
        if has("syntax")
            syntax on
        endif

        set mouse=a                    " 在任何模式下启用鼠标
        set t_Co=256                   " 在终端启用256色
        set backspace=2                " 设置退格键可用

        " Source a global configuration file if available
        if filereadable("/etc/vim/vimrc.local")
            source /etc/vim/vimrc.local
        endif
    endif
endif

" =============================================================================
"                          << 以下为用户自定义配置 >>
" =============================================================================

" 去掉有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 不让vim发出讨厌的滴滴声
set noerrorbells

" 开启语法高亮
syntax enable

" 开启语法高亮
syntax on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 高亮字符，让其不受100列限制
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength '\%101v.*'

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

" 高亮光标所在行与列
set cul     "set cursorline
set cuc     "set cursorcolumn

" 设置历史记录条数
set history=2000

" 检测文件类型
filetype on

" 针对不同的文件，采用不同的缩进方式
filetype indent on

" 载入文件类型插件
filetype plugin on

" 启动自动补全
filetype plugin indent on

"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

" 文件修改之后自动读入
set autoread

" 设置取消备份，禁止临时文件生成
set nobackup
set noswapfile

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

" 字符间插入的像素行数目
set linespace=0

" create undo file
set undolevels=1000 " how many undos
set undoreload=10000 " number of lines to save for undo
if v:version >= 730
    set undofile     " keep a persistent backup file
    set undodir=/tmp/vimundo/
endif

"set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 设置退出Vim之后内容显示在终端屏幕，可以用于查看和复制
" 好处:误删什么，如果以前屏幕打开可以用来找回
" set t_ti= t_te=

" 设置在Vim中可以使用鼠标，防止终端无法拷贝
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
" The mouse can be enabled for different modes:
"   n Normal mode
"   v Visual mode
"   i Insert mode
"   c Command-line mode
"   h all previous modes when editing a help file
"   a all previous modes
"set mouse=a
set mouse=
"set selection=exclusive
"set selectmode=mouse,key

" 与windows共享剪贴板
set clipboard+=unnamed

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 允许在有未保存的修改时切换缓冲区
"set hidden

" 光标可以移动到行尾末字符后
set virtualedit=onemore
" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错

" 设置编码方式
set encoding=utf-8                                    "设置gvim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

if (g:iswindows && g:isGUI)
    "解决菜单乱码
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "解决consle输出乱码
    language messages zh_CN.utf-8
endif

" -----------------------------------------------------------------------------
"  < 搜索和匹配 >
" -----------------------------------------------------------------------------
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
set ignorecase

" 不要高亮被搜索的句子（phrases）
set nohlsearch

" 在搜索时，输入的词句的逐字符高亮，如要查找book单词，当输入到/b时，会自动找到
" 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依次类推，
" 进行查找时，使用此设置会快速找到答案，当你找要匹配的单词时，别忘记回车
set incsearch

" 当搜索的时候尝试smart
set smartcase

" 输入:set list命令时应显示哪些字符
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

" 在搜索时如到达文件尾则绕回文件头继续搜索
set ws
"set nows

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------

" 启用折叠
set foldenable

" 折叠方法
" manual 手工折叠
" indent 缩进折叠
" expr 表达式折叠
" syntax 语法折叠
" diff 对没有更改的文件折叠
" marker 标记折叠
set foldmethod=manual

" 用空格键开关折叠
" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
" 设置代码折叠, 选中一块代码，然后输入zf即可折叠这一段代码
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

" 设定自动保存折叠
"au BufWinLeave *.* silent mkview
"au BufWinEnter *.* silent! loadview

" 设置C/C++方式自动对齐
set autoindent
set cindent
set smartindent
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式

" 设置tab宽度
set tabstop=4

" 设置自动对齐空格数
set shiftwidth=4

" 按退格键时可以一次删除4个空格
set softtabstop=4

" 编辑的时候将所有的tab设置为空格(expandtab)
set et

" 使用Backspace直接删除tab
set smarttab

" 不在单词中间折行
set lbr

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>

" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>

" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>

" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------

" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    nmap <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif

" 不要图形按钮
set go=

" 设置魔术
set magic

" 设置主题
set background=dark
colorscheme molokai
"colorscheme solarized
set t_Co=256

" 设置 gVim 窗口初始位置及大小
if g:isGUI
    " au GUIEnter * simalt ~x                           "窗口启动时自动最大化
    winpos 100 10                                     "指定窗口出现的位置，坐标原点在屏幕左上角
    set lines=38 columns=120                          "指定窗口大小，lines为高度，columns为宽度
endif

" 设置字体
"set gfn=Consolas:h12:cANSI
set gfn=Powerline_Consolas:h12:cANSI

" 添加水平滚动条
"set guioptions+=b

" 取消菜单栏和导航栏
set guioptions-=m
set guioptions-=T

" 去除左右两边滚动条
set go-=r
set go-=L

" 设置光标为竖线
set guicursor=n-v-c:ver5

" 设置水平行数和竖直列数
set lines=35
set columns=99

" 状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态行
set laststatus=2

" 显示当前行号和列号
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 左下角显示当前Vim模式
set showmode

" 显示行号
set number

" 不自动换行显示
set nowrap

" 设置代码匹配,包括括号匹配情况
set showmatch

" 当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=

" 防止特殊符号无法正常显示
set ambiwidth=double

" -----------------------------------------------------------------------------
" Other Settings
" -----------------------------------------------------------------------------
" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC		" .vimrc修改之后自动加载

" 设置当文件被改动时自动载入
set autoread

" 在切换buffer时自动保存当前文件
set autowrite

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

" 代码补全
set completeopt=preview,menu
set wildmenu         " vim自身命名行模式智能补全
"set completeopt-=preview " 补全时不显示窗口，只显示补全列表

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *.txt setfiletype txt
au BufRead,BufNewFile *.txt setlocal ft=txt

" windows系统下与source insight 软件切换
nnoremap <silent> <F12> :!start "C:\Program Files (x86)\Source Insight 4.0\sourceinsight4.exe" -i +<C-R>=expand(line("."))<CR> %<CR>

" 新建文件，导入自定义模板
"autocmd BufNewFile *.cpp 0r $VIMRUNTIME/template/demo.cpp | %s/__data__/\=strftime("%c")/g | %s/__macro__/\=toupper(bufname(""))/g | 19,20s/\./_/g

" -----------------------------------------------------------------------------
" 括号自动补全
" -----------------------------------------------------------------------------
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" -----------------------------------------------------------------------------
"  < 新文件自动插入文件头 >
" -----------------------------------------------------------------------------
" 新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
" 定义函数SetTitle，自动插入文件头
func! SetTitle()
    " 如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'mkd'
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: ")
        call append(line(".")+2, "  > Mail: ")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif

    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif

    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif

    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif

    if &filetype == 'java'
    call append(line(".")+6,"public class ".expand("%:r"))
    call append(line(".")+7,"")
    endif
endfunc
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

" -----------------------------------------------------------------------------
" Autocommands
" -----------------------------------------------------------------------------
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
    autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
    autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
    autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o
    autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe " normal g`\"" |
    \ endif
endif "has("autocmd")

" 自动切换目录为当前编辑文件所在目录
au BufRead,BufNewFile,BufEnter * cd %:p:h

" -----------------------------------------------------------------------------
" Keyboard Commands
" -----------------------------------------------------------------------------

" 去空行
nnoremap <F2> :g/^\s*$/d<CR>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 编辑vimrc文件
nnoremap <leader>e :edit $MYVIMRC<cr>

" C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

" C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!gdb ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -g -o %<"
        exec "!gdb ./%<"
    endif
endfunc

" 去掉行尾尾随空格
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" =============================================================================
"                          << 以下为用户自定义配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Vim-Plug 插件管理工具配置 >
" -----------------------------------------------------------------------------
" 插件使用：(1)Begin the section with call plug#begin()
"           (2)List the plugins with Plug commands
"           (3)call plug#end() to update &runtimepath and initialize plugin system
" 命令： (1)PlugStatus   用于检查插件的状态
"        (2)PlugInstall  安装字体后必须设置
"        (3)PlugUpdate   检查插件并更新
"        (4)PlugClean    清除插件
"        (5)PlugUpgrade  更新插件本身

" Specify a directory for plugins
" - For vim: $VIM/vimfiles/bundle
" - Avoid using standard Vim directory names like 'plugin'
if filereadable(expand("$VIM/vimfiles/autoload/plug.vim"))
    call plug#begin('$VIM/vimfiles/bundle')

    " General {
    	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    	"Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'tpope/vim-fugitive'
    " }

    " General Programming {
        " Pick one of the checksyntax, jslint, or syntastic
        "Plug 'w0rp/ale'
        "Plug 'scrooloose/nerdcommenter'
        "Plug 'Valloric/YouCompleteMe'
        "Plug 'othree/vim-autocomplpop'
        "Plug 'godlygeek/tabular'
        "Plug 'luochen1990/rainbow'
        Plug 'skywind3000/asyncrun.vim'
        if executable('ctags')
            "Plug 'majutsushi/tagbar'
        endif
    " }

    " Python {
        "Plug 'klen/python-mode'
        "Plug 'yssource/python.vim'
        "Plug 'python_match.vim'
        "Plug 'pythoncomplete'
    " }

    " Javascript {
        "Plug 'elzr/vim-json'
        "Plug 'groenewege/vim-less'
        "Plug 'pangloss/vim-javascript'
        "Plug 'briancollins/vim-jst'
        "Plug 'kchmck/vim-coffee-script'
    " }

    " HTML {
        "Plug 'amirh/HTML-AutoCloseTag'
        "Plug 'hail2u/vim-css3-syntax'
        "Plug 'gorodinskiy/vim-coloresque'
        "Plug 'othree/html5.vim', { 'for': 'html' }
        "Plug 'tpope/vim-haml'
        "Plug 'mattn/emmet-vim'
    " }

    call plug#end()
endif

" =============================================================================
"                          << 以下为常用插件配置 >>
" =============================================================================

" Plugins {

    " Taglist {
        if (has("gui_running"))
            let Tlist_Ctags_Cmd = '$VIM\vim81'
        else
            let Tlist_Ctags_Cmd = '/usr/bin/ctags'
        endif
        let Tlist_Show_One_File=1        		" 显示一个文件的tag
        let Tlist_Exit_OnlyWindow=1        		" 当只剩下Tlist的时候自动关闭
        let Tlist_Use_Right_Window = 1    		" 在右侧显示窗口
        let Tlist_Auto_Open=0           		" 自动打开TagList的window
        let Tlist_Compact_Format = 0    		" 压缩方式
        let Tlist_Use_SingleClick = 1    		" 打开tags用单击
        let Tlist_WinWidth = 20            		" 窗口宽度
        let Tlist_File_Fold_Auto_Close=1    	" close tag folders for inactive buffers
        let Tlist_Enable_Fold_Column=1       	" show the fold indiactor column in the taglist window
        let Tlist_Auto_Update=1                 " 自动更新TagList包含最新编辑的文件
        let Tlist_Sort_Type="name"              " 按照名称排序
        let Tlist_Process_File_Always=1         " 让TagList始终解释文件中的tag,不管TagList窗口有没有打开

        nnoremap <silent> <A-4> :TlistToggle<CR>
    " }

    " Ctags {
        set tags=./tags
        set autochdir
        "set tags+=D:\Workarea\Project\HacLink\HacLink\tags
        " 手动刷新tags
        nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>
    " }

    " airline {
        let g:airline#extensions#tabline#enabled = 1               " 开启tabline
        let g:airline#extensions#tabline#left_sep = ' '            " tabline中当前buffer两端的分隔字符
        let g:airline#extensions#tabline#left_alt_sep = '|'        " tabline中未激活buffer两端的分隔字符
        let g:airline#extensions#tabline#buffer_nr_show = 1        " tabline中buffer显示编号

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif

        "let g:airline_theme="onedark"

        let g:airline_powerline_fonts = 1            " 安装字体后必须设置

        "unicode symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
        let g:airline_symbols.maxlinenr = ''
        let g:airline_symbols.whitespace = 'Ξ'
    " }

    " Rainbow {
        if isdirectory(expand("$VIM/vimfiles/bundle/rainbow/"))
            let g:rainbow_active = 1         "0 if you want to enable it later via :RainbowToggle
        endif
    "}

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        if filereadable(expand("$VIMRUNTIME/plugin/html_autoclosetag.vim"))
            au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
            nmap <Leader>ac <Plug>ToggleAutoCloseMappings
        endif
    " }

    " NerdTree {
        if isdirectory(expand("$VIM/vimfiles/bundle/nerdtree"))
            nnoremap <silent> <leader>n :NERDTreeToggle<cr>
            inoremap <silent> <leader>n <esc> :NERDTreeToggle<cr>

            " Open NERDTree automatically when vim starts up
            autocmd vimenter * NERDTree
            let g:NERDTreeWinPos="left"
            let g:NERDTreeWinSize=25
            let g:NERDTreeShowLineNumbers=1
            let g:neocomplcache_enable_at_startup = 1
            let NERDTreeHighlightCursorline=1
            let g:NERDTreeFileExtensionHighlightFullName = 1
            let g:NERDTreeExactMatchHighlightFullName = 1
            let g:NERDTreePatternMatchHighlightFullName = 1
            let g:NERDTreeHighlightFolders = 1
            let g:NERDTreeHighlightFoldersFullName = 1
            let g:NERDTreeDirArrowExpandable='►'
            let g:NERDTreeDirArrowCollapsible='▼'
            " 只剩 NERDTree时自动关闭
            autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
        endif
    " }
	
	" AsyncRun {
		let g:asyncrun_open=8
	" }

    " PyMode {
        " Disable if python support not present
        if !has('python') && !has('python3')
            let g:pymode = 0
        endif

        if isdirectory(expand("$VIM/vimfiles/bundle/python-mode"))
            let g:pymode_lint_checkers = ['pyflakes']
            let g:pymode_trim_whitespaces = 0
            let g:pymode_options = 0
            let g:pymode_rope = 0
        endif
    " }

    " nerdtree-git-plugin {
    	let s:NERDTreeIndicatorMap = {
                \ 'Modified'  : '✹',
                \ 'Staged'    : '✚',
                \ 'Untracked' : '✭',
                \ 'Renamed'   : '➜',
                \ 'Unmerged'  : '═',
                \ 'Deleted'   : '✖',
                \ 'Dirty'     : '✗',
                \ 'Clean'     : '✔︎',
                \ 'Ignored'   : '☒',
                \ 'Unknown'   : '?'
                \ }
    " }
" }
