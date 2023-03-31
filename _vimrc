"======================================
"说明
"======================================

"本文件采用utf-8编码
"简称声明
"vim:vim的console版本
"gvim:vim的gui版本

"======================================
"通用外观
"======================================

"行号相关
set number "显示绝对行号
"set relativenumber "显示相对行号

"光标位置标尺相关(无效果)
"set ruler "显示光标所在位置

"折行相关
"set wrap "自动折行：将超出屏幕范围的文本打断并显示在下一行
set nowrap "取消自动折行

"高亮相关
syntax on "对特殊的文本显示特定高亮

"highlght 主要是用来配色的，包括语法高亮等个性化的配置。可以通过:h highlight，查看详细信息
"CursorLine 和 CursorColumn 分别表示当前所在的行列
"cterm 表示为原生vim设置样式，设置为NONE表示可以自定义设置。
"ctermbg 设置终端vim的背景色
"ctermfg 设置终端vim的前景色
"guibg 和 guifg 分别是设置gvim的背景色和前景色，本人平时都是使用终端打开vim，所以只是设置终端下的样式

"set cursorline "高亮显示光标当前行
"set cursorcolumn "高亮显示光标当前列
"highlight CursorLine cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

"缩进相关
set tabstop=4 "设置tab键的宽度为4
set softtabstop=4 "按下tab键时显示宽度为4，按下backspace键删除tab时删除宽度为4
set shiftwidth=4 "缩进字符宽度为4
set expandtab "键入tab时自动给替换为空格

"特殊字符显示相关
set list "显示不可见字符
set listchars=eol:$,tab:>~,space:. "设置换行显示为$,tab键显示为>~~~,space键显示为.

"状态栏显示相关
set laststatus=2 "在页面的倒数第二行显示状态栏
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&fileencoding}\ %c:%l/%L%)\ [%p%%]\  "路径 [编辑器] 系统 编码 光标位置 [显示进度]

"======================================
"gvim外观
"======================================

"gvim配色方案相关
colorscheme evening "设置gvim的配色为evening

"打开gvim时最大化窗口
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"gvim字体相关
set guifont=Consolas:h14 "设置gvim显示字体为Consolas,字号为14号

"======================================
"兼容性
"======================================

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
