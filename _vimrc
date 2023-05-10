"=====================================
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
":source $MYVIMRC "修改本文件并保存后在命令模式输入可立即应用更改
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
set listchars=tab:>~,space:·,eol:$ "设置换行eol键显示为$,tab键显示为>~~~,space键显示为.

"配色方案相关
set background=dark "设置深色背景颜色美化
colorscheme desert "设置配色方案为desert
"某些配色方案下特殊字符tab(\t)/space(\s)/eol(\n\r)显示不明显
"将tab/space/eol的前景色统一设置为深灰色
if has("gui_running")
    highlight MyTabSpaceEol ctermfg=darkgrey guifg=darkgrey
else
    highlight MyTabSpaceEol ctermfg=darkgrey
endif
match MyTabSpaceEol /\t\|\s\|\n\|\r/

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
    "set guioptions-=0 "隐藏标签栏
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
"字号       14

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
"设置:term命令终端窗口从插入模式变为普通(一般)模式的快捷键为alt+q
tnoremap <A-q> <C-\><C-n>

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
tnoremap <C-a> <C-\><C-n>gg0vG$

"选中(shift+方向键)
nnoremap <S-Up> vk
inoremap <S-Up> <Esc>vk
vnoremap <S-Up> k
tnoremap <S-Up> <C-\><C-n>vk

nnoremap <S-Down> vj
inoremap <S-Down> <Esc>vj
vnoremap <S-Down> j
tnoremap <S-Down> <C-\><C-n>vj

nnoremap <S-Left> vh
inoremap <S-Left> <Esc>vh
vnoremap <S-Left> h
tnoremap <S-Left> <C-\><C-n>vh

nnoremap <S-Right> vl
inoremap <S-Right> <Esc>vl
vnoremap <S-Right> l
tnoremap <S-Right> <C-\><C-n>vl

"复制(ctrl+c)
vnoremap <C-c> y<Esc>

"剪切(ctrl+x)
vnoremap <C-x> d<Esc>

"粘贴(ctrl+v)
inoremap <C-v> <Esc>pa

"复制当前行到下一行(ctrl+d)
nnoremap <C-d> yyp
inoremap <C-d> <Esc>yypa

"撤销(ctrl+z)
nnoremap <C-z> u
inoremap <C-z> <Esc>ua

"取消撤销(ctrl+y)
nnoremap <C-y> <C-r>
inoremap <C-y> <Esc><C-r>a

"关闭光标所在窗口(ctrl+w q)
nnoremap <C-w>q :q!<CR>
inoremap <C-w>q <Esc>:q!<CR>
vnoremap <C-w>q <Esc><Esc>:q!<CR>
tnoremap <C-w>q <C-\><C-n><Esc><Esc>iexit<CR> 
"使用q!会把由此终端窗口打开的全部应用强制关闭之后再退出
"使用exit可以关闭此终端窗口，并在后台继续运行原先由此终端窗口打开的应用程序

"打开终端(ctrl+t)
nnoremap <C-t> :bo term<CR>
inoremap <C-t> <Esc>:bo term<CR>
vnoremap <C-t> <Esc><Esc>:bo term<CR>
tnoremap <C-t> <C-\><C-n><Esc><Esc>:bo term<CR>

"fast grep(ctrl+g)
nnoremap <C-g> :tab new<CR>:E<CR>:copen<CR>:vimgrep 
inoremap <C-g> <Esc>:tab new<CR>:E<CR>:copen<CR>:vimgrep 
vnoremap <C-g> <Esc><Esc>:tab new<CR>:E<CR>:copen<CR>:vimgrep 
tnoremap <C-g> <C-\><C-n><Esc><Esc>:tab new<CR>:E<CR>:copen<CR>:vimgrep 

"新增一空白行(o下方 O上方)
"原因是vim/gvim自带的o/O在有些情况下新增行会附带一些特殊格式/字符
nnoremap o o<Esc>0d$a
nnoremap O O<Esc>0d$a
