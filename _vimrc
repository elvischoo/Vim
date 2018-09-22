""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" һ���趨 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
"���windows�µ�������������
"""""""""""""""""""""""""""""
set fileencodings=utf-8,gbk,chinese

"������Ĳ˵�����
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"���console�������
language messages zh_CN.utf-8

" ������ʱ����ʾ�Ǹ�Ԯ���������ͯ����ʾ 
set shortmess=atI

" ͨ��ʹ��: commands������������ļ�����һ�б��ı�� 
set report=0 

" ����vim��������ĵε��� 
set noerrorbells

"��Ҫʹ��vi�ļ���ģʽ������vim�Լ���
set nocompatible


set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" �����﷨����  
syntax enable  

" �����﷨����
syntax on  

" ����ȫ�ֱ��� 
set viminfo+=!

" �������·��ŵĵ��ʲ�Ҫ�����зָ� 
set iskeyword+=_,$,@,%,#,-

" ��������  
"set guifont=Monaco\ 12
set guifont=Consolas\ 

" �����ַ������䲻��100������ 
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white 
:match OverLength '\%101v.*' 

" ״̬����ɫ 
highlight StatusLine guifg=SlateBlue guibg=Yellow 
highlight StatusLineNC guifg=Gray guibg=White 

" ������ʷ��¼����  
set history=2000  

" ����ļ�����  
filetype on  

" ��Բ�ͬ���ļ������ò�ͬ��������ʽ  
filetype indent on  

" �����ļ����Ͳ�� 
filetype plugin on  

" �����Զ���ȫ
filetype plugin indent on

" �ļ��޸�֮���Զ�����
set autoread

" ��������ʾ��ʾ
"set shortmess=atI

" ����ȡ�����ݣ���ֹ��ʱ�ļ�����  
set nobackup  
set noswapfile

" ��Ҫ����swap�ļ�����buffer��������ʱ�������� 
setlocal noswapfile 
set bufhidden=hide 

" �ַ���������������Ŀ 
set linespace=0

" create undo file
set undolevels=1000 " how many undos
set undoreload=10000 " number of lines to save for undo
if v:version >= 730
    set undofile     " keep a persistent backup file
    set undodir=/tmp/vimundo/
endif

"set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" ��ʾ��ǰ������  
"set cursorline  
"set cursorcolumn  

" �����˳�Vim֮��������ʾ���ն���Ļ���������ڲ鿴�͸���
" �ô�:��ɾʲô�������ǰ��Ļ�򿪿��������һ�
" set t_ti= t_te=

" ������Vim�п���ʹ����꣬��ֹ�ն��޷�����  
" ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ�� 
set mouse=a 
set selection=exclusive 
set selectmode=mouse,key 

" ��windows��������� 
set clipboard+=unnamed

" ��״̬������ʾ�������λ�õ��кź��к� 
set ruler 
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%) 

" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2 
set cmdheight=2 


" ʹ�ظ����backspace����������indent, eol, start�� 
set backspace=2 

" ����backspace�͹�����Խ�б߽� 
set whichwrap+=<,>,h,l 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ������ƥ�� 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ������ʾƥ������� 
set showmatch 

" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩 
set matchtime=5 

" ��������ʱ����Դ�Сд 
set ignorecase 

" ��Ҫ�����������ľ��ӣ�phrases�� 
set nohlsearch 

" ������ʱ������Ĵʾ�����ַ�����������firefox�������� 
set incsearch 

" ����:set list������Ӧ����ʾЩɶ�� 
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ 

" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о��� 
set scrolloff=3 

" ��Ҫ��˸ 
set novisualbell 

" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩 
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

" ������ʾ״̬�� 
set laststatus=2 

"==========================================
" Display Settings
"==========================================
"
" ��ʾ��ǰ�кź��к�
set ruler

" ��״̬����ʾ�������������
set showcmd

" ���½���ʾ��ǰVimģʽ
set showmode

" ����ƶ����ٱ���������
"set scrolloff=7

" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" ������ʾ״̬��(Powerline��Ҫ2��)  
set laststatus=2  

" ��ʾ�к�  
set number  

" ָ��������
set nowrap  

" ���ô���ƥ��,��������ƥ�����  
set showmatch  

" how many tenths of a second to blink when matching brackets
" setmatchtime=2

" ������ʱ����(is)  
set incsearch  

" ������������(hlsearch)  
set hls  

" ��������ʱ���Դ�Сд  
set ignorecase  

" ��������ʱ����smart  
set smartcase  

""""""""""""""""""""""""""""""
" ���ô����۵�, ѡ��һ����룬Ȼ������zf�����۵���һ�δ���
""""""""""""""""""""""""""""""

" set foldenable
" �۵�����
" manual �ֹ��۵�
" indent �����۵�
" expr ���ʽ�۵�
" syntax �﷨�۵�
" diff ��û�и��ĵ��ļ��۵�
" marker ����۵�
"set foldmethod=indent
"set foldlevel=99

"�ÿո�������۵�
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' :'zo')<CR>

"�趨�Զ������۵�
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent! loadview

" ����C/C++��ʽ�Զ�����  
set autoindent  
set cindent  
set smartindent  

" ����tab���  
set tabstop=4  

" �����Զ�����ո���  
set shiftwidth=4  

" ���˸��ʱ����һ��ɾ��4���ո�
"set softtabstop=4

" �༭��ʱ�����е�tab����Ϊ�ո�(expandtab)  
set et  

" ʹ��Backspaceֱ��ɾ��tab  
set smarttab  

" ���ڵ����м�����  
set lbr  

" ��������
set gfn=Consolas:h12
au GUIEnter * simalt ~x  "�������

set guioptions -=m
set guioptions -=T

colorscheme torte

""""""""""""""""""""""""""""""
"�����Զ���ȫ
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
"let Tlist_Show_One_File=1

" ���ֻ��һ��buffer��kill����Ҳkill��buffer
let Tlist_Exit_OnlyWindow=1

" ���Ҳ���ʾ����
let Tlist_Use_Right_Window = 1

" ѹ����ʽ
let Tlist_Compact_Format = 0

" �Զ���
let Tlist_Auto_Open = 1
let Tlist_Use_SingleClick = 1

" ���ڿ��
let Tlist_WinWidth = 20
nnoremap <silent> <A-4> :TlistToggle<CR>
set tags=./tags
set autochdir
"set tags+=D:\Workarea\Project\HacLink\HacLink\tags

" ����F8��������tag�ļ���������taglist
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags;
set autochdir

""""""""""""""""""""""""""""""
" airline������趨
""""""""""""""""""""""""""""""
"��װ������������
let g:airline_powerline_fonts = 1

"����tabline
let g:airline#extensions#tabline#enabled = 1      "tabline�е�ǰbuffer���˵ķָ��ַ�
"let g:airline#extensions#tabline#left_sep = ' '   "tabline��δ����buffer���˵ķָ��ַ�
"let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline��buffer��ʾ���
let g:airline#extensions#tabline#buffer_nr_show = 1 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"unicode symbols
let g:airline_left_sep = '>'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '<'
let g:airline_right_alt_sep = '<'
let g:airline_symbols.linenr = '��'
let g:airline_symbols.branch = '��'
" ӳ���л�buffer�ļ�λ
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Autocommands 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ֻ�������ļ����ͱ���⵽��ʱ����ʾ�кţ���ͨ�ı��ļ�����ʾ 

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
" C/C++�ı���������
""""""""""""""""""""""""""""""
map <F5> :call CompileRunCpp()
func! CompileRunCpp()
	exec "w"
	exec "!g++ -g3 % -o %<"
	exec "!./%<"
endfun

""""""""""""""""""""""""""""""
" Doxygen�Զ����ע��
" ʹ�÷�ʽ��
" (1) �ں�������һ�а�fg�������Զ��������µ�ע��
" (2) �ڹ���ƶ���Դ�ļ��Ŀ�ʼ����Ȼ���������������� :DoxAutho	
""""""""""""""""""""""""""""""
map fg :Dox<CR>
let g:DoxygenToolkit_briefTag_pre="@Breif: "
let g:DoxygenToolkit_paramTag_pre="@Param: "
let g:DoxygenToolkit_returnTag="@Returns: "
let g:DoxygenToolkit_authorName="xxxxx: "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:Doxygen_enhanced_color=1
let g:DoxygenToolkit_blockHeader="==============================="
let g:DoxygenToolkit_blockFooter="===================================="
