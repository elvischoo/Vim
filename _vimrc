"========================================  
" File Name: .vimrc  
" Author: Elvis 
" Description: Vim配置文档  
" Date: 2018.9.23  
"======================================== 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 一般设定 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 启动的时候不显示那个援助索马里儿童的提示 
set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过 
set report=0 

" 不让vim发出讨厌的滴滴声 
set noerrorbells

"不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 开启语法高亮  
syntax enable  

" 开启语法高亮
syntax on  

" 保存全局变量 
set viminfo+=!

" 带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#,-

" 设置字体  
"set guifont=Monaco\ 12
set guifont=Consolas\ 

" 高亮字符，让其不受100列限制 
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white 
:match OverLength '\%101v.*' 

" 状态行颜色 
highlight StatusLine guifg=SlateBlue guibg=Yellow 
highlight StatusLineNC guifg=Gray guibg=White 

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

" 文件修改之后自动读入
set autoread

" 启动后不显示提示
"set shortmess=atI

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

" 显示当前横竖线  
"set cursorline  
"set cursorcolumn  

" 设置退出Vim之后内容显示在终端屏幕，可以用于查看和复制
" 好处:误删什么，如果以前屏幕打开可以用来找回
" set t_ti= t_te=

" 设置在Vim中可以使用鼠标，防止终端无法拷贝  
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位） 
set mouse=a 
set selection=exclusive 
set selectmode=mouse,key 

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

""""""""""""""""""""""""""""""
" FileEncode Settings
""""""""""""""""""""""""""""""

" 设置编码方式  
set encoding=utf-8  

" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk,chinese  

set helplang=cn 

" 只对终端影响(默认)
set termencoding=utf-8

" use UNIX as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m

" 合并两行中文时，不在中间加空格：
set formatoptions+=B

"""""""""""""""""""""""""""""
"解决windows下的中文乱码问题
"""""""""""""""""""""""""""""

"解决中文菜单乱码
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决console输出乱码
language messages zh_CN.utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 搜索和匹配 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 高亮显示匹配的括号 
set showmatch 

" 匹配括号高亮的时间（单位是十分之一秒） 
set matchtime=5 

" 在搜索的时候忽略大小写 
set ignorecase 

" 不要高亮被搜索的句子（phrases） 
set nohlsearch 

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索） 
set incsearch 

" 输入:set list命令是应该显示些啥？ 
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ 

" 光标移动到buffer的顶部和底部时保持3行距离 
set scrolloff=3 

" 不要闪烁 
set novisualbell 

""""""""""""""""""""""""""""""
" Display Settings
""""""""""""""""""""""""""""""

" 我的状态行显示的内容（包括文件类型和解码） 
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

" 总是显示状态行 
set laststatus=2 

" 显示当前行号和列号
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 左下角显示当前Vim模式
set showmode

" 光标移动至少保留的行数
"set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 总是显示状态栏(Powerline需要2行)  
set laststatus=2  

" 显示行号  
set number  

" 指定不折行
set nowrap  

" 设置代码匹配,包括括号匹配情况  
set showmatch  

" how many tenths of a second to blink when matching brackets
" setmatchtime=2

" 开启及时搜索(is)  
set incsearch  

" 设置搜索高亮(hlsearch)  
set hls  

" 设置搜索时忽略大小写  
set ignorecase  

" 当搜索的时候尝试smart  
set smartcase  

""""""""""""""""""""""""""""""
" 设置代码折叠, 选中一块代码，然后输入zf即可折叠这一段代码
""""""""""""""""""""""""""""""

" set foldenable
" 折叠方法
" manual 手工折叠
" indent 缩进折叠
" expr 表达式折叠
" syntax 语法折叠
" diff 对没有更改的文件折叠
" marker 标记折叠
"set foldmethod=indent
"set foldlevel=99

"用空格键开关折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

"设定自动保存折叠
"au BufWinLeave *.* silent mkview
"au BufWinEnter *.* silent! loadview

" 设置C/C++方式自动对齐  
set autoindent  
set cindent  
set smartindent  

" 设置tab宽度  
set tabstop=4  

" 设置自动对齐空格数  
set shiftwidth=4  

" 按退格键时可以一次删除4个空格
"set softtabstop=4

" 编辑的时候将所有的tab设置为空格(expandtab)  
set et  

" 使用Backspace直接删除tab  
set smarttab  

" 不在单词中间折行  
set lbr  

""""""""""""""""""""""""""""""
" Theme Settings
""""""""""""""""""""""""""""""

" Set extra options when running in GUI mode
"if has("gui_running")
"    set guifont=Monaco\ 12
"    set guioptions-=T
"    set guioptions+=e
"    set guioptions-=r
"    set guioptions-=L
"    set guitablabel=%M\ %t
"    set showtabline=1 
"    set linespace=2 
"    set noimd   
"    set t_Co=256
"endif

" 设置主题  
set background=dark
colorscheme molokai  
"colorscheme solarized
set t_Co=256

" 设置字体
set gfn=Consolas:h12
au GUIEnter * simalt ~x  "窗口最大化

" 添加水平滚动条  
"set guioptions+=b  

" 取消菜单栏和导航栏  
set guioptions-=m  
set guioptions-=T  

" 去除左右两边滚动条
set go-=r
set go-=L

" 设置水平行数和竖直列数  
set lines=35  
set columns=99  

" 使pathogen生效(插件管理器,只需将插件放入bundle，将pathogen.vim放入autoload即可)  
"execute pathogen#infect() 

""""""""""""""""""""""""""""""
" Other Settings
""""""""""""""""""""""""""""""

autocmd! bufwritepost _vimrc source %    " .vimrc修改之后自动加载(Windows)
"autocmd! bufwritepost .vimrc source %    " .vimrc修改之后自动加载(Linux)

""""""""""""""""""""""""""""""
"括号自动补全
""""""""""""""""""""""""""""""
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
if (has("gui_running"))
	let Tlist_Ctags_Cmd = 'ctags'
else
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif

let Tlist_Ctags_Cmd = 'C:\Program Files (x86)\Vim\vim73e\ctags'

" 显示一个文件的tag 
let Tlist_Show_One_File=1

" 当只剩下Tlist的时候自动关闭
let Tlist_Exit_OnlyWindow=1

" 在右侧显示窗口
let Tlist_Use_Right_Window = 1

" 自动打开TagList的window  
let Tlist_Auto_Open=0

" 压缩方式
let Tlist_Compact_Format = 0

" 打开tags用单击 
let Tlist_Use_SingleClick = 1

" close tag folders for inactive buffers  
let Tlist_File_Fold_Auto_Close=1
 
" show the fold indiactor column in the taglist window  
let Tlist_Enable_Fold_Column=1

" 自动更新TagList包含最新编辑的文件  
let Tlist_Auto_Update=1

" 按照名称排序  
let Tlist_Sort_Type="name"

" 让TagList始终解释文件中的tag,不管TagList窗口有没有打开  
let Tlist_Process_File_Always=1 

" 窗口宽度
let Tlist_WinWidth = 20
nnoremap <silent> <A-4> :TlistToggle<CR>
set tags=./tags
set autochdir
"set tags+=D:\Workarea\Project\HacLink\HacLink\tags
" 手动刷新tags
nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>

""""""""""""""""""""""""""""""
" airline插件的设定
""""""""""""""""""""""""""""""
"安装字体后必须设置
let g:airline_powerline_fonts = 1

"开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
"let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
"let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"unicode symbols
let g:airline_left_sep = '>'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '<'
let g:airline_right_alt_sep = '<'
let g:airline_symbols.linenr = '★'
let g:airline_symbols.branch = '¤'
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Autocommands 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示 

if has("autocmd") 
autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number 
autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o--> 
autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o 
autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100 
autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim 
autocmd BufReadPost * 
\ if line("'\"") > 0 && line("'\"") <= line("$") | 
\ exe " normal g`\"" | 
\ endif 
endif "has("autocmd")

""""""""""""""""""""""""""""""
" C/C++的编译与运行
""""""""""""""""""""""""""""""
map <F5> :call CompileRunCpp()
func! CompileRunCpp()
	exec "w"
	exec "!g++ -g3 % -o %<"
	exec "!./%<"
endfun

""""""""""""""""""""""""""""""
" Doxygen自动添加注释
" 使用方式：
" (1) 在函数名的一行按fg键即可自动生成如下的注释
" (2) 在光标移动到源文件的开始出，然后在命令行下输入 :DoxAutho	
""""""""""""""""""""""""""""""
map fg :Dox<CR>
let g:DoxygenToolkit_briefTag_pre="@Breif: "
let g:DoxygenToolkit_paramTag_pre="@Param: "
let g:DoxygenToolkit_returnTag="@Returns: "
let g:DoxygenToolkit_authorName="xxxxx: "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:Doxygen_enhanced_color=1
let g:DoxygenToolkit_blockHeader="===================================="
let g:DoxygenToolkit_blockFooter="===================================="

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"NERDTree快捷键
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set encoding=utf-8
nmap <F2> :NERDTree  <CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
let NERDTreeHighlightCursorline=1
nnoremap <leader>n :NERDTreeToggle<CR>  
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif 

""""""""""""""""""""""""""""""
" closetag settings 自动补全html/xml标签
""""""""""""""""""""""""""""""
au FileType html,xml so C:\Program Files (x86)\Vim\vim81\plugin\html_autoclosetag.vim