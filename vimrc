"***************************************************************
"以下为vim自带属性
"***************************************************************

" 文件侦查启动,用以检测文件的后缀
filetyp on

" 语法高亮
syntax on
syntax enable

" 语法折叠
set fdm=syntax

" set ai 或者 set autoindent vim使用自动对齐，也就是把当前行的对齐格式应用到下一行
" set si 或者 set smartindent 依据上面的对齐格式，智能的选择对齐方式
set si ai

" 自动格式化
set formatoptions=tcrqn

" 使用空格替代空格
" set ts 或者 set tabstop=4 设置tab键为4个空格
" set sw 或者 set shiftwidth 设置当行之间交错时使用4个空格
set expandtab ts=4 sw=4

set background=dark

"colo evening
colo desert
"colo torte
"colo slate

set foldnestmax=1

" 显示行号
set nu

" 高亮显示当前行/列
set cursorline
"set cursorcolumn

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 高亮显示搜索结果
set hlsearch
"set nohlsearch

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 禁止折行
set nowrap

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

" 将制表符显示为'>---',将行尾空格显示为'-'
set list
set listchars=tab:>-,trail:-

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2

" 在搜索的时候忽略大小写
set ignorecase

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 不要备份文件（根据自己需要取舍）
set nobackup

" 显示标尺
set ruler

set t_Co=256
"***************************************************************



"***************************************************************
"以下为安装的插件 不是vim自带属性
"***************************************************************

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'luochen1990/rainbow'
Bundle 'mattn/webapi-vim'
"Bundle 'Wildog/airline-weather.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" YouCompeteMe
" 这个leader就映射为逗号“，”
"let mapleader = ","
" 配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 按,jd 会跳转到定义
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1

" tagbar
" 设置tagbar使用的ctags的插件,必须要设置对
let g:tagbar_ctags_bin='/usr/bin/ctags'
" 设置tagbar的窗口宽度
let g:tagbar_width=30
" 设置tagbar的窗口显示的位置,为左边
let g:tagbar_right=1
" 打开文件自动 打开tagbar
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
" 映射tagbar的快捷键
map <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'	 : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

" airline
" 打开tabline功能,方便查看Buffer和切换
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 设置切换Buffer快捷键
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" 关闭状态显示空白符号计数,这个对我用处不大
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" vim-indent-guides
" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" indentLine
let g:indentLine_color_term = 248
"let g:indentLine_char = '|'
let g:indentLine_enabled = 1

" NERDTree
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
nmap <leader>n :NERDTree<CR>
" 自动启动NERDTree
"autocmd vimenter * NERDTree
" 焦点移到主窗口
"autocmd vimenter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup=1

" solarized
"let g:solarized_termcolors= 16 | 256
"let g:solarized_termtrans = 0 | 1
"let g:solarized_degrade = 0 | 1
"let g:solarized_bold = 1 | 0
"let g:solarized_underline = 1 | 0
"let g:solarized_italic = 1 | 0
"let g:solarized_contrast = “normal”| “high” or “low”
"let g:solarized_visibility= “normal”| “high” or “low”
"color solarized

" rainbow
" 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" airline-weather
"let g:weather#area = 'beijing,china'
"let g:weather#unit = 'metric'
"let g:weather#appid = 'd0f83627f8ab3f939cb7e701e7f40278'
"let g:weather#cache_file = '~/.cache/.weather'
"let g:weather#cache_ttl = '3600'
"let g:weather#format = '%s %.0f'
"let g:weather#status_map = {
"            \ "01d": "☀",
"            \ "02d": "☁",
"            \ "03d": "☁",
"            \ "04d": "☁",
"            \ "09d": "☂",
"            \ "10d": "☂",
"            \ "11d": "☈",
"            \ "13d": "❅",
"            \ "50d": "≡",
"            \ "01n": "☽",
"            \ "02n": "☁",
"            \ "03n": "☁",
"            \ "04n": "☁",
"            \ "09n": "☂",
"            \ "10n": "☂",
"            \ "11n": "☈",
"            \ "13n": "❅",
"            \ "50n": "≡",
"            \}
"***************************************************************

"***************************************************************
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    "如果文件类型为python文件
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    "如果文件类型为ruby文件
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    "elseif &filetype =://github.com/amix/vimrc.git= 'mkd'
        "call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "  > File Name: ".expand("%"))
        call append(line(".")+1, "  > Module:")
        call append(line(".")+2, "  > Author: wangyp")
        call append(line(".")+3, "  > Company:")
        call append(line(".")+4, "  > Department:")
        call append(line(".")+5, "  > Mail: pengpeng.ps@163.com")
        call append(line(".")+6, "  > Created Time: ".strftime("%c"))
        call append(line(".")+7, " ************************************************************************/")
        call append(line(".")+8, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+9, "#include<iostream>")
        call append(line(".")+10, "using namespace std;")
        call append(line(".")+11, "")
    endif
    if &filetype == 'c'
        call append(line(".")+9, "#include<stdio.h>")
        call append(line(".")+10, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+9, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+10, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+11, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+9,"public class ".expand("%:r"))
        call append(line(".")+10,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G
"***************************************************************


""***************************************************************
""F2处理行尾的空格以及文件尾部的多余空行
""Automatically remove trailing spaces when saving a file.
"autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
""Remove indenting on empty line
"map <F2> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
"function! CleanupBuffer(keep)
"    " Skip binary files
"    if (&bin > 0)
"        return
"    endif
"    " Remove spaces and tabs from end of every line, if possible
"    silent! %s/\s\+$//ge
"    " Save current line number
"    let lnum = line(".")
"    " number of last line
"    let lastline = line("$")
"    let n        = lastline
"    " while loop
"    while (1)
"        " content of last line
"        let line = getline(n)
"        " remove spaces and tab
"        if (!empty(line))
"            break
"        endif
"        let n = n - 1
"    endwhile
"    " Delete all empty lines at the end of file
"    let start = n+1+a:keep
"    if (start < lastline)
"        execute n+1+a:keep . "," . lastline . "d"
"    endif
"    " after clean spaces and tabs, jump back
"    exec "normal " . lnum . "G"
"endfunction
"***************************************************************
