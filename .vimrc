""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
"set cul                                         " 高亮光标所在行
"set cuc
set shortmess=atI                                " 启动的时候不显示那个援助乌干达儿童的提示  
set go=                                          " 不要图形按钮  
"color desert                                    " 设置背景主题  
color ron                                        " 设置背景主题  
"color torte                                     " 设置背景主题  
"set guifont=Courier_New:h10:cANSI               " 设置字体  
"autocmd InsertLeave * se nocul                  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul                    " 用浅色高亮当前行  
set ruler                                        " 显示标尺  
set showcmd                                      " 输入的命令显示出来，看的清楚些  
"set whichwrap+=<,>,h,l                          " 允许backspace和光标键跨越行边界(不建议)  
set scrolloff=3                                  " 光标移动到buffer的顶部和底部时保持3行距离  
set laststatus=2                                 " 启动显示状态行(1),总是显示状态行(2)  
"set foldenable                                  " 允许折叠  
"set foldmethod=manual                           " 手动折叠  
set nocompatible                                 " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
if version >= 603                                " 显示中文帮助
    set helplang=cn
    set encoding=utf-8
endif
set autoindent                                   " 自动缩进
set cindent
set tabstop=4                                    " Tab键的宽度
set softtabstop=4                                " 统一缩进为4
set shiftwidth=4
set expandtab                                    " 使用空格代替制表符
set smarttab                                     " 在行和段开始处使用制表符
set number                                       " 显示行号
set history=1000                                 " 历史记录数
set hlsearch                                     " 搜索逐字符高亮
set incsearch
set langmenu=zh_CN.UTF-8                         " 语言设置
set helplang=cn
set cmdheight=2                                  " 总是显示状态行
set viminfo+=!                                   " 保存全局变量
set iskeyword+=_,$,@,%,#,-                       " 带有如下符号的单词不要被换行分割
let g:indentLine_char = '┊'                      " 缩进字符
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
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

        "    elseif &filetype == 'mkd'
        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "	> File Name: ".expand("%")) 
        call append(line(".")+1, "	> Author: ") 
        call append(line(".")+2, "	> Mail: ") 
        call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
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
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":nmap <silent> <F8> <ESC>:Tlist<RETURN>
let g:tagbar_left=1
nmap <F8> :TagbarToggle<CR>
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-Z> <Esc>zzi
map! <C-O> <C-Y>,
map <C-A> ggVG$"+y
map <Esc><Esc> :w<CR>
map <F12> gg=G
map <C-w> <C-w>w
imap <C-k> <C-y>,
imap <C-t> <C-q><TAB>
imap <C-j> <ESC>
" 选中状态下 Ctrl+c 复制
"map <C-v> "*pa
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y
set mouse=v
"set clipboard=unnamed
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"nnoremap <C-n> :CtrlPFunky<Cr>
"列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录  
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"C，C++ 按F5编译运行
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
"C,C++的调试
map <F9> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -std=c++11 -g -o %<"
	exec "!gdb ./%<"
endfunc
"代码格式优化化
map <F6> :call FormartSrc()<CR><CR>
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif
autocmd vimenter * if !argc() | NERDTree | endif " 当打开vim且没有文件时自动打开NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " 只剩 NERDTree时自动关闭
set autoread                                     " 设置当文件被改动时自动载入
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr> " quickfix模式
filetype on                                      " 侦测文件类型
filetype plugin on                               " 载入文件类型插件
filetype indent on                               " 为特定文件类型载入相关缩进文件
"set clipboard+=unnamed                          " 共享剪贴板
set autowrite                                    " 自动保存
set magic                                        " 设置魔术
set guioptions-=T                                " 隐藏工具栏
set guioptions-=m                                " 隐藏菜单栏
""set foldcolumn=0
""set foldmethod=indent 
""set foldlevel=3 
set nocompatible                                 " 不要使用vi的键盘模式，而是vim自己的
set noeb                                         " 去掉输入错误的提示声音
set confirm                                      " 在处理未保存或只读文件的时候，弹出确认
set nobackup                                     " 禁止生成临时文件
set noswapfile
set ignorecase                                   " 搜索忽略大小写
set linespace=0
set wildmenu                                     " 增强模式中的命令行自动完成操作
set backspace=2                                  " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l                           " 允许backspace和光标键跨越行边界
"set mouse=a                                     " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set selection=exclusive
"set selectmode=mouse,key
set report=0                                     " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\             " 在被分割的窗口间显示空白，便于阅读
set showmatch                                    " 高亮显示匹配的括号
set matchtime=1                                  " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3                                  " 光标移动到buffer的顶部和底部时保持3行距离
set completeopt=longest,menu                     " 打开文件类型检测, 加了这句才可以用智能补全

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" python补全
"
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ctags
set tags=tags;                                   " 设置tags

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>

"
" YouCompleteMe
"
"let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 0
let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_warning_symbol = '>*'
"let g:syntastic_warning_symbol = '>*'

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
nnoremap <F4> :YcmForceCompileAndDiagnostics <CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" other
"
set sw=4
set ts=4
set et
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set mousemodel=popup
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
let $JS_CMD='node'
let NERDTreeIgnore=['\.pyc']
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict


"
" Bundle
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
"
""" original repos on github
Bundle 'tpope/vim-fugitive'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Yggdroot/indentLine'
Bundle 'fatih/vim-go'
"Bundle 'tpope/vim-rails.git'
""" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/syntastic'
""" non github repos
"Bundle 'https://github.com/wincent/command-t.git'
Bundle 'https://github.com/majutsushi/tagbar.git'
Bundle 'Auto-Pairs'
Bundle 'python-imports.vim'
"Bundle 'CaptureClipboard'
"Bundle 'ctrlp-modified.vim'
"Bundle 'last_edit_marker.vim'
Bundle 'synmark.vim'
"Bundle 'Python-mode-klen'
"Bundle 'SQLComplete.vim'
"Bundle 'Javascript-OmniCompletion-with-YUI-and-j'
"Bundle 'JavaScript-Indent'
"Bundle 'Better-Javascript-Indentation'
"Bundle 'jslint.vim'
"Bundle "pangloss/vim-javascript"
Bundle 'Vim-Script-Updater'
"Bundle 'ctrlp.vim'
"Bundle 'tacahiroy/ctrlp-funky'
"Bundle 'jsbeautify'
Bundle 'The-NERD-Commenter'
"Bundle 'django_templates.vim'
"Bundle 'Django-Projects'
"Bundle 'FredKSchott/CoVim'
"Bundle 'djangojump'
