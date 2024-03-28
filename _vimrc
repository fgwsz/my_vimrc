"======================================
"说明
"======================================

"本文件采用utf-8编码
"简称声明
"vim:vim的console版本
"gvim:vim的gui版本

"======================================
"通用功能设置
"======================================

"文件载入相关
autocmd BufWritePost $MYVIMRC source $MYVIMRC "修改本文件并保存后立即生效
set autoread "文件改动时重新读取

"临时文件相关
set nobackup "表示不需要备份文件
set noswapfile "表示不创建临时交换文件
set nowritebackup "表示编辑的时候不需要备份文件
set noundofile "表示不创建撤销文件

"vi兼容相关
set nocompatible "不兼容vi模式，避免bug

"按键可用性
set backspace=indent,eol,start "让backspace在insert模式下可用

"文件类型相关
filetype on "检测文件类型

"插件设置相关
filetype plugin on "允许插件

"编码相关
set encoding=utf-8 "设置vim/gvim打开文件的默认编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 "设置vim/gvim按照从左到右的顺序自动推断文件的编码类型

"命令模式补全
set wildmenu "使用增强的命令模式补全
"具体补全操作如下
"tab   呼出备选项菜单栏
"tab/→ 切换到下一个备选项
"←     切换到上一个备选项
"enter 选中备选项并退出备选项菜单栏
"↓     不选中任何备选项直接退出备选项菜单栏

"错误提示
set noerrorbells "关闭错误提示音
set novisualbell "关闭错误提示屏幕闪烁

"退出提示
set noconfirm "关闭退出提示

"======================================
"通用外观设置
"======================================

"行相关
set number "显示绝对行号
"set relativenumber "显示相对行号
"set wrap "自动折行：将超出屏幕范围的文本打断并显示在下一行
set nowrap "取消自动折行
set sidescroll=1 "更加平滑的逐个字符扩展显示
set scrolloff=999 "让编辑行自动位于屏幕中间
set colorcolumn=80 "在第80列显示一条竖线，作为标准列宽的标识

"高亮相关
syntax on "开启语法高亮
set hlsearch "查找结果高亮显示
set incsearch "查找结果随着键入匹配项实时高亮显示
":nohlsearch 命令模式输入可关闭上一次查找所对应的高亮显示
set showmatch "光标移动到括号时高亮显示匹配括号
"高亮显示光标所在行/列
"set cursorline "高亮显示光标当前行
"set cursorcolumn "高亮显示光标当前列
"设置光标所在行列高亮显示的颜色
""highlght:用来配色的命令，包括语法高亮等个性化的配置
""CursorLine/CursorColumn:当前所在的行列
""cterm:为vim设置样式，设置为NONE表示可以自定义设置
""ctermbg:vim的背景色
""ctermfg:vim的前景色
""guibg:vim的背景色
""guifg:vim的前景色
"highlight CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

"特殊字符显示相关
set list "显示不可见字符
set listchars=tab:>~,space:∙,eol:$ "设置tab键显示为>~~~,space键显示为∙,换行eol键显示为$

"配色方案相关
set background=dark "设置深色背景颜色美化
"colorscheme desert "设置配色方案为desert
"colorscheme evening "设置配色方案为evening
colorscheme industry "设置配色方案为industry
"某些配色方案下特殊字符tab(\t)/space(\s)/eol(\n\r)显示不明显
"将tab/space/eol的前景色统一设置为深灰色
"if has("gui_running")
"    highlight MyTabSpaceEol ctermfg=darkgrey guifg=darkgrey
"else
"    highlight MyTabSpaceEol ctermfg=darkgrey
"endif
"match MyTabSpaceEol /\t\|\s\|\n\|\r/

"缩进相关
set tabstop=4 "设置tab键的宽度为4
set softtabstop=4 "按下tab键时显示宽度为4，按下backspace键删除tab时删除宽度为4
set shiftwidth=4 "缩进字符宽度为4
set expandtab "键入tab时自动替换为空格

"状态栏显示相关
set laststatus=2 "显示状态栏
set ruler "显示光标所在位置
set showmode "显示当前模式
set showcmd "显示键入按键信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&fileencoding}\ %c:%l/%L%)\ [%p%%]\  "路径 [文件类型] 系统 编码 光标当前行字符数:当前行号/总行数 [显示进度]

"标签栏显示相关
set showtabline=2 "总是显示标签栏
set tabpagemax=15 "设置显示标签栏数量最大为15，默认为10

"======================================
"gvim独有设置
"======================================

"打开gvim时最大化窗口
if has("gui_running")
    if has('win32')
        au GUIEnter * simalt ~x
    else
        au GUIEnter * call MaximizeWindow()
    endif
endif

function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"gvim字体相关
"设置gvim显示字体为Consolas,字号为14号
if has("gui_running")
    if has("win32")
        set guifont=Consolas:h14
    else
        set guifont=Consolas\ 14
    endif
endif

"gvim gui菜单显示相关
if has("gui_running")
    set guioptions-=m "隐藏菜单栏
    set guioptions-=T "隐藏工具栏
    set guioptions-=L "隐藏左侧滚动条
    set guioptions-=r "隐藏右侧滚动条
    set guioptions-=b "隐藏底部滚动条
    set guioptions-=e "使用内置标签栏，而不是GUI标签栏
endif

"======================================
"插件设置
"======================================
"
"Netrw是vim/gvim自带的文件浏览器插件

""vim/gvim启动时自动打开Netrw
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore "自动运行命令:Vex[plore]
"augroup END
"
"Netrw打开文件时的窗口操作
"0(默认):在当前窗口中打开文件
"1:用水平拆分窗口打开文件
"2:用垂直拆分窗口打开文件
"3:用新建标签页打开文件
"4:用之前一个窗口打开文件
"let g:netrw_browse_split=4

"Netrw顶端的横幅可见性
"0:隐藏 1(默认):显示
let g:netrw_banner=1 "显示横幅

"Netrw目录/文件显示模式
"0(默认):thin 1:long 2:wide 3:tree
let g:netrw_liststyle=1 "设置显示模式为long

"Netrw目录/文件排序方式
"let g:netrw_sort_by='time' "设置文件排序方式为按照时间排序
"let g:netrw_sort_direction='reverse' "设置安排方式为降序
let g:netrw_sort_by='name' "设置文件排序方式为按照名称排序(默认)

"Netrw分屏窗口最大宽度(百分比)
"let g:netrw_winsize=25 "设置为整个vim/gvim窗口宽度的25%

"在Netrw浏览文件的时候，使用Windows Explorer打开光标选中的文件(gx)
if has('win32')
    "使用Windows Explorer打开光标选中的文件
    function! OpenFileWithWindowsExplorer()
        let l:current_path=expand('%:p')
        let l:temp_filename=expand('<cfile>',':p')
        let l:filename=substitute(l:temp_filename,'/','','g')
        let l:file_path=l:current_path.l:filename
        execute '!explorer.exe '.l:file_path
    endfunction
    "定义自定义命令OpenFile，调用上述函数
    command! OpenFile :call OpenFileWithWindowsExplorer()
    "绑定Netrw打开文件的快捷键(gx)
    nnoremap gx :OpenFile<CR>
endif

"======================================
"操作系统兼容性
"======================================

"终端外观设置
"光标形状   实心块状
"背景色     RGB#0C0C0C
"前景色     RGB#CCCCCC
"光标颜色   RGB#95D6D4
"选中背景色 RGB#13A10E
"字体       Consolas
"字号       14 半粗体

"终端快捷键设置
"终端粘贴<ctrl-v>和vim进入列选可视模式<ctrl-v>冲突，应替换为<ctrl-alt-v>

"终端光标形状跟随vim模式自动切换(<Esc>字符替换可能会有隐形bug，不推荐使用)
"实现效果：普通模式实心块状，插入模式线条状，替换模式下划线状
"&t_SI 表示插入模式
"&t_SR 表示替换模式
"&t_EI 表示普通模式
""\<Esc>[6 q"用来配置光标的形状，其中6的取值可以是1~6，分别指代不同的光标样式
"if has('win32')
"    let &t_SI = "\<Esc>[6 q"
"    let &t_SR = "\<Esc>[4 q"
"    let &t_EI = "\<Esc>[2 q"
"endif

"vim/gvim命令模式打开终端相关
"设置:term[inal]命令默认打开的终端窗口为powershell(默认值为cmd)
if has('win32')
    set shell=powershell
endif
"退出终端
"使用q!会把由此终端窗口打开的全部应用强制关闭之后再退出
"使用exit可以关闭此终端窗口，并在后台继续运行原先由此终端窗口打开的应用程序

"中文输入相关
"在vim中可以使用任何终端支持的输入法来输入中文
"在gvim中(windows操作系统)请使用windows自带输入法，使用其他输入法不一定能切换中英文并输入中文

"剪切板相关
"设置vim/gvim和系统的剪切板互通
if has('win32')
    set clipboard=unnamed
endif

"======================================
"映射快捷键
"======================================

"保存(ctrl+s)
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc><Esc>:w<CR>

"全选(ctrl+a)
nnoremap <C-a> gg0vG$
inoremap <C-a> <Esc>gg0vG$
vnoremap <C-a> <Esc><Esc>gg0vG$

"复制当前行到下一行(ctrl+d)
nnoremap <C-d> yyp
inoremap <C-d> <Esc>yypa

"撤销(ctrl+z)
nnoremap <C-z> u
inoremap <C-z> <Esc>ua

"取消撤销(ctrl+y)
nnoremap <C-y> <C-r>
inoremap <C-y> <Esc><C-r>a

"关闭光标所在窗口(alt+w)
nnoremap <A-w> :q!<CR>
inoremap <A-w> <Esc>:q!<CR>
vnoremap <A-w> <Esc><Esc>:q!<CR>

"设置开启终端时自动切换到当前打开的文件路径
function! OpenCurrentPathTerminal()
    execute 'lcd '.expand('%:p:h').'|belowright terminal'
endfunction
"定义自定义命令OpenTerm，调用上述函数
command! OpenTerm :call OpenCurrentPathTerminal()
"在当前窗口(分屏窗口)的下方打开一个新的终端窗口(分屏窗口)(ctrl+t)
"该终端窗口的工作路径为当前打开的文件路径
nnoremap <C-t> :OpenTerm<CR>
inoremap <C-t> <Esc>:OpenTerm<CR>
vnoremap <C-t> <Esc><Esc>:OpenTerm<CR>
"命令行模式，分屏窗口只显示终端(ctrl+t)
cnoremap <C-t> :OpenTerm<CR><C-w>k:q!<CR>

"终端退出insert模式进入normal模式(alt+e)
tnoremap <A-e> <C-\><C-n>

"open tab of fast grep(ctrl+g)
nnoremap <C-g> :tab new<CR>:E<CR>:copen<CR>:vimgrep 
inoremap <C-g> <Esc>:tab new<CR>:E<CR>:copen<CR>:vimgrep 
vnoremap <C-g> <Esc><Esc>:tab new<CR>:E<CR>:copen<CR>:vimgrep 

"新增一空白行(o下方 O上方)
"原因是vim/gvim自带的o/O在有些情况下新增行会附带一些特殊格式/字符
"这里采用"_d命令删除（不存入剪切板），而不是d剪切，是为了保护剪切板中的内容
nnoremap o o<Esc>0"_d$a
nnoremap O O<Esc>0"_d$a

"删除可视模式中选中区域的所有换行，并将光标移动到该行行首
"rr:remove \r
vnoremap rr :s/\n//g<CR>0

"删除可视模式中选中区域的所有空行(包括只含有空格的行)
"rl:remove empty line
vnoremap rl :g/^\s*$/d<CR>

"删除可视模式中选中区域的所有空格
"rs:remove space
vnoremap rs :s/\s//g<CR>

"命令行模式粘贴(ctrl+r)
cnoremap <C-r> <C-r>*

"设置宏的时候删除原先记录的宏操作
nnoremap qa :let @a=""<CR>qa
nnoremap qb :let @b=""<CR>qb
nnoremap qc :let @c=""<CR>qc
nnoremap qd :let @d=""<CR>qd
nnoremap qe :let @e=""<CR>qe
nnoremap qf :let @f=""<CR>qf
nnoremap qg :let @g=""<CR>qg
nnoremap qh :let @h=""<CR>qh
nnoremap qi :let @i=""<CR>qi
nnoremap qj :let @j=""<CR>qj
nnoremap qk :let @k=""<CR>qk
nnoremap ql :let @l=""<CR>ql
nnoremap qm :let @m=""<CR>qm
nnoremap qn :let @n=""<CR>qn
nnoremap qo :let @o=""<CR>qo
nnoremap qp :let @p=""<CR>qp
nnoremap qq :let @q=""<CR>qq
nnoremap qr :let @r=""<CR>qr
nnoremap qs :let @s=""<CR>qs
nnoremap qt :let @t=""<CR>qt
nnoremap qu :let @u=""<CR>qu
nnoremap qv :let @v=""<CR>qv
nnoremap qw :let @w=""<CR>qw
nnoremap qx :let @x=""<CR>qx
nnoremap qy :let @y=""<CR>qy
nnoremap qz :let @z=""<CR>qz
nnoremap q0 :let @0=""<CR>q0
nnoremap q1 :let @1=""<CR>q1
nnoremap q2 :let @2=""<CR>q2
nnoremap q3 :let @3=""<CR>q3
nnoremap q4 :let @4=""<CR>q4
nnoremap q5 :let @5=""<CR>q5
nnoremap q6 :let @6=""<CR>q6
nnoremap q7 :let @7=""<CR>q7
nnoremap q8 :let @8=""<CR>q8
nnoremap q9 :let @9=""<CR>q9

"快捷切换分屏窗口(<Ctrl-*>代替<Ctrl-w>*)
"h 移动到左边的分屏窗口
"j 移动到下边的分屏窗口
"k 移动到上边的分屏窗口
"l 移动到右边的分屏窗口
"w 移动到下一个分屏窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w> <C-w>w
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
inoremap <C-w> <Esc><C-w>w
vnoremap <C-h> <Esc><Esc><C-w>h<CR>
vnoremap <C-j> <Esc><Esc><C-w>j<CR>
vnoremap <C-k> <Esc><Esc><C-w>k<CR>
vnoremap <C-l> <Esc><Esc><C-w>l<CR>
vnoremap <C-w> <Esc><Esc><C-w>w<CR>
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
tnoremap <C-w> <C-w>w

"快捷移动分屏窗口的位置(<Alt-m>x代替<Ctrl-w>X)
"为什么不用<Ctrl-m>?
"原因：在Windows vim插入模式中输入回车<Enter>，会被率先匹配成<Ctrl-m>,即^M
"h 移动分屏窗口到左边
"j 移动分屏窗口到下边
"k 移动分屏窗口到上边
"l 移动分屏窗口到右边
nnoremap <A-m>h <C-w>H
nnoremap <A-m>j <C-w>J
nnoremap <A-m>k <C-w>K
nnoremap <A-m>l <C-w>L
inoremap <A-m>h <Esc><C-w>H
inoremap <A-m>j <Esc><C-w>J
inoremap <A-m>k <Esc><C-w>K
inoremap <A-m>l <Esc><C-w>L
vnoremap <A-m>h <Esc><Esc><C-w>H<CR>
vnoremap <A-m>j <Esc><Esc><C-w>J<CR>
vnoremap <A-m>k <Esc><Esc><C-w>K<CR>
vnoremap <A-m>l <Esc><Esc><C-w>L<CR>
tnoremap <A-m>h <C-w>H
tnoremap <A-m>j <C-w>J
tnoremap <A-m>k <C-w>K
tnoremap <A-m>l <C-w>L
