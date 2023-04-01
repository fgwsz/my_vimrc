"======================================
"说明
"======================================

"本文件采用utf-8编码
"简称声明
"vim:vim的console版本
"gvim:vim的gui版本

"======================================
"自动更新
"======================================

"source $VIM/_vimrc "当_vimrc文件修改成功时自动适用(有bug)
set autoread "文件改动时重新读取

"======================================
"通用外观
"======================================

"行号相关
set number "显示绝对行号
"set relativenumber "显示相对行号

"光标位置标尺相关(无效果)
set ruler "显示光标所在位置

"显示状态(无效果)
set showmode "在状态栏显示当前模式

"折行相关
"set wrap "自动折行：将超出屏幕范围的文本打断并显示在下一行
set nowrap "取消自动折行

"高亮相关
syntax on "开启语法高亮
set hlsearch "查找结果高亮显示

"括号匹配相关
set showmatch "光标移动到括号时显示当前括号的匹配括号

"高亮显示当前光标位置
""highlght 主要是用来配色的，包括语法高亮等个性化的配置。可以通过:h highlight，查看详细信息
""CursorLine 和 CursorColumn 分别表示当前所在的行列
""cterm 表示为原生vim设置样式，设置为NONE表示可以自定义设置。
""ctermbg 设置终端vim的背景色
""ctermfg 设置终端vim的前景色
""guibg 和 guifg 分别是设置gvim的背景色和前景色，本人平时都是使用终端打开vim，所以只是设置终端下的样式
"set cursorline "高亮显示光标当前行
"set cursorcolumn "高亮显示光标当前列
"highlight CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

"配色方案相关
set background=dark "设置深色背景颜色美化
colorscheme desert "设置配色方案为desert

"特殊字符显示相关
set list "显示不可见字符
set listchars=eol:$,tab:>~,space:· "设置换行显示为$,tab键显示为>~~~,space键显示为.

"为了解决某些配色方案下vim下特殊字符tab/space/enter显示不明显的问题
"将tab/space/enter的前景色设置为深灰色
if has("gui_running")
    highlight MyTabSpaceEol ctermfg=darkgrey guifg=darkgrey
else
    highlight MyTabSpaceEol ctermfg=darkgrey
endif
match MyTabSpaceEol /\t\|\s\|\n/

"缩进相关
set tabstop=4 "设置tab键的宽度为4
set softtabstop=4 "按下tab键时显示宽度为4，按下backspace键删除tab时删除宽度为4
set shiftwidth=4 "缩进字符宽度为4
set expandtab "键入tab时自动给替换为空格

"状态栏显示相关
set laststatus=2 "显示状态栏
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&fileencoding}\ %c:%l/%L%)\ [%p%%]\  "路径 [文件类型] 系统 编码 光标当前行字符数:当前行号/总行数 [显示进度]

"标签栏显示相关
set showtabline=2 "总是显示标签栏
set tabpagemax=15 "设置显示标签栏数量最大为15，默认为10

"自带文件浏览器(Netrw)相关

""自动打开文件浏览器
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

"设置目录/文件默认排序方式
"let g:netrw_sort_by='time' "设置文件排序方式为按照时间排序
"let g:netrw_sort_direction='reverse' "设置安排方式为降序
let g:netrw_sort_by='name' "设置文件排序方式为按照名称排序

"默认情况下，Netrw打开文件时将在当前窗口中打开文件
"使用下面数值可以配置Netrw打开文件的方式
"1.用水平拆分窗口打开文件
"2.用垂直拆分窗口打开文件
"3.用新建标签页打开文件
"4.用之前一个窗口打开文件
"let g:netrw_browse_split=4

"设置默认显示模式
"0:thin 1:long 2:wide 3:tree4种显示模式
let g:netrw_liststyle=1 "设置显示模式为wide

"显示/隐藏Netrw顶端的横幅(Banner)
"let g:netrw_banner=0 "隐藏横幅
let g:netrw_banner=1 "显示横幅

"设置文件浏览器的宽度
"let g:netrw_winsize=25 "设置文件浏览器的宽度为窗口的25%

"======================================
"vim外观
"======================================

"光标形状(平台相关)
"效果：普通模式下块状，插入模式下条状
"For VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x, Konsole KDE5 and others), wsltty and Windows Terminal
"&t_SI 表示插入模式
"&t_SR 表示替换模式
"&t_EI 表示普通模式
""\<Esc>[6 q" 用来配置光标的形状。其中 6 的取值可以是 1 - 6，分别指代不同的光标样式
if has('win32')
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif

"======================================
"gvim外观
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
if has("gui_running")
    set guifont=Consolas:h14 "设置gvim显示字体为Consolas,字号为14号
endif

"gvim gui菜单显示相关
if has("gui_running")
    set guioptions-=m "隐藏菜单栏
    set guioptions-=T "隐藏工具栏
    set guioptions-=L "隐藏左侧滚动条
    set guioptions-=r "隐藏右侧滚动条
    set guioptions-=b "隐藏底部滚动条
    set guioptions-=0 "隐藏Tab栏
endif

"======================================
"兼容性
"======================================

"终端相关
set shell=powershell "设置:term[inal]命令默认打开的终端窗口为powershell(默认值为cmd)

"中文输入法相关
"在gvim中请使用微软自带输入法，使用其他输入法不一定能切换中英文并输入中文
"在vim中可以使用任何控制台支持的输入法来输入中文

"vi兼容相关
set nocompatible "不兼容vi模式，避免bug

"按键可用性
set backspace=indent,eol,start "让backspace在insert模式下可用

"剪切板相关
set clipboard=unnamed "设置vim/gvim和系统的剪切板互通

"编码相关
set encoding=utf-8 "设置vim/gvim打开文件的默认编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 "设置vim/gvim按照从左到右的顺序自动推断文件的编码类型

"临时文件相关
set nobackup "表示不需要备份文件 
set noswapfile "表示不创建临时交换文件 
set nowritebackup "表示编辑的时候不需要备份文件 
set noundofile "表示不创建撤销文件
