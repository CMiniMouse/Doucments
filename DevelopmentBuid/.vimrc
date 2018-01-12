filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"代码资源管理器
Plugin 'scrooloose/nerdtree'
map <leader>e :NERDTreeToggle<CR>
"Symbol list查看函数，类等
Plugin 'vim-scripts/taglist.vim'
map <F9> :TlistToggle<CR>
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"自动补全代码
"Plugin 'Valloric/YouCompleteMe'
"nnoremap <leader>jd :YcmCompleterGoToDefinitionElseDeclaration<CR>
"Support Python mode
"Plugin 'python-mode/python-mode'
"let g:pymode_python='python3'

call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

set showmatch      " 高亮显示对应的括号
set number         " 显示行号
set autoindent     " 自动对齐
"set cindent        " C风格的对齐方式
set tabstop=4      " Tab键的宽度
set expandtab      " Tab键扩展空格
syntax on          " 自动语法高亮
set softtabstop=4
set shiftwidth=4   "  统一缩进为4
set matchtime=5    " 对应括号高亮的时间（单位是十分之一秒）
set autowrite      " 在切换buffer时自动保存当前文件
set autoread       " 设置当文件被改动时自动载入
set completeopt=preview,menu "代码补全

"设置数字颜色
hi Number ctermfg=white
"设置字符串颜色
hi String guifg=#EEEE00 gui=bold

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"==================自定义的键映射======================
" 括号自动生成
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" 单键<F7>控制syntax on/off。原因是有时候颜色太多会妨碍阅读。
map <F7> :if exists("syntax_on") <BAR>
\    syntax off <BAR><CR>
\  else <BAR>
\syntax enable <BAR>
\  endif

" <F5>编译和运行C程序
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc

" <F6>编译和运行C++程序
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./<"
endfunc

" <F4>编译和运行python程序
map <leader>r :call CompileRunPython()<CR>
func! CompileRunPython()
exec "w"
exec "!python3 %"
endfunc

" <F1>实现(、[、{、"、'  输入后自动补全右边部分，光标也会位于中间位置.
map <F1> :call MyCompleteAdd()<CR>
func! MyCompleteAdd()
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
endfunc

" <F2>取消(、[、{、"、'  输入后自动补全右边.
map <F2> :call MyCompleteDel()<CR>
func! MyCompleteDel()
inoremap ( (
inoremap [ [
inoremap { {
inoremap < <
inoremap " "
inoremap ' '
endfunc
