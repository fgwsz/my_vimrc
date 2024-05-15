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
"设置vim/gvim按照从左到右的顺序自动推断文件的编码类型
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

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
set textwidth=0 "设置单行输入字符数量无限制
"vim在单行字符数量超过colorcolumn数量时键入字符，可能会触发vim的自动换行操作
"设置textwidth选项为0(字符数量无限制)，会关闭vim的自动换行操作

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
"if has('gui_running')
"    highlight CursorLine   gui=NONE guibg=Black guifg=NONE
"    highlight CursorColumn gui=NONE guibg=Black guifg=NONE
"else
"    highlight CursorLine   cterm=NONE ctermbg=Black ctermfg=NONE
"    highlight CursorColumn cterm=NONE ctermbg=Black ctermfg=NONE
"endif

"特殊字符显示相关
set list "显示不可见字符
"设置tab键显示为>―――,space键显示为·,换行eol键显示为↓
set listchars=tab:>―,space:·,eol:↓

"配色方案相关
set background=dark "设置深色背景颜色美化
colorscheme industry "设置配色方案为industry

"缩进相关
set tabstop=4 "设置tab键的宽度为4
set softtabstop=4 "按下tab键时显示宽度为4，按下backspace键删除tab时删除宽度为4
set shiftwidth=4 "缩进字符宽度为4
set expandtab "键入tab时自动替换为空格

"标签栏显示相关
set showtabline=2 "总是显示标签栏
"set tabpagemax=15 "设置显示标签栏数量最大为15，默认为10
"检查编号为n的标签页是否存在已修改未保存的缓冲区
function! TabModified(n)
    let l:label=''
    let l:buflist=tabpagebuflist(a:n)
    for l:bufnr in l:buflist
        if getbufvar(l:bufnr,'&readonly')||getbufvar(l:bufnr,'&buftype')==#'terminal'
            continue
        endif
        if getbufvar(l:bufnr,'&modified')
            let l:label='＊'
            break
        endif
    endfor
    return l:label
endfunction
"返回编号为n的标签页的名称
function! TabName(n)
    let l:buf=tabpagebuflist(a:n)[tabpagewinnr(a:n)-1]
    let l:filetype=getbufvar(l:buf,'&filetype','')
    let l:buftype=getbufvar(l:buf,'&buftype','')
    if l:filetype==#'netrw'
        return 'Netrw'
    endif
    if l:buftype==#'terminal'
        return 'Terminal'
    endif
    if l:buftype==#'quickfix'
        return 'Quickfix List'
    endif
    let l:name=bufname(l:buf)
    if !empty(l:name)
        return fnamemodify(l:name,':t')
    else
        if !empty(l:filetype)
            return l:filetype
        elseif !empty(l:buftype)
            return l:buftype
        else
            return 'No Name'
        endif
    endif
endfunction
"tabline高亮配色
if has('gui_running')
    highlight SelectTabNum      gui=bold guifg=Blue     guibg=Yellow
    highlight SelectTabModified gui=bold guifg=White    guibg=Red
    highlight SelectTabName     gui=bold guifg=White    guibg=Blue
    highlight SelectWindowsNum  gui=bold guifg=Blue     guibg=Green
    highlight NormalTabNum      gui=NONE guifg=DarkBlue guibg=DarkYellow
    highlight NormalTabModified gui=NONE guifg=Gray     guibg=DarkRed
    highlight NormalTabName     gui=NONE guifg=Gray     guibg=DarkBlue
    highlight NormalWindowsNum  gui=NONE guifg=DarkBlue guibg=DarkGreen
else
    highlight SelectTabNum      cterm=bold ctermfg=Blue     ctermbg=Yellow
    highlight SelectTabModified cterm=bold ctermfg=White    ctermbg=Red
    highlight SelectTabName     cterm=bold ctermfg=White    ctermbg=Blue
    highlight SelectWindowsNum  cterm=bold ctermfg=Blue     ctermbg=Green
    highlight NormalTabNum      cterm=NONE ctermfg=DarkBlue ctermbg=DarkYellow
    highlight NormalTabModified cterm=NONE ctermfg=Gray     ctermbg=DarkRed
    highlight NormalTabName     cterm=NONE ctermfg=Gray     ctermbg=DarkBlue
    highlight NormalWindowsNum  cterm=NONE ctermfg=DarkBlue ctermbg=DarkGreen
endif
"标签栏整体的显示函数
function! TabLine()
    let l:result=''
    for l:index in range(tabpagenr('$'))
        let l:hlName=''
        let l:hlModified=''
        let l:select=0
        if l:index+1==tabpagenr()
            let l:hlName='%#SelectTabName#'
            let l:hlModified='%#SelectTabModified#'
            let l:result.=l:hlName.'%#SelectTabNum#%T['.(l:index+1).']'
            let l:select=1
        else
            let l:hlName='%#NormalTabName#'
            let l:hlModified='%#NormalTabModified#'
            let l:result.=l:hlName.'%#NormalTabNum#%T['.(l:index+1).']'
        endif
        let l:result.=l:hlModified.'%{TabModified('.(l:index+1).')}'
        let l:result.=l:hlName.' %<%{TabName('.(l:index+1).')} '
        let l:wincount=tabpagewinnr(l:index+1,'$')
        if l:wincount>1
            if l:select==1
                let l:result.='%#SelectWindowsNum#('.l:wincount.')'
            else
                let l:result.='%#NormalWindowsNum#('.l:wincount.')'
            endif
        endif
    endfor
    "最后一个标签页之后用TabLineFill填充
    let l:result.='%#TabLineFill#%T'
    return l:result
endfunction
"设置标签栏的显示样式
set tabline=%!TabLine()

"状态栏显示相关
set laststatus=2 "显示状态栏
"得到当前缓冲区模式字符串
function! BufMode()
    let l:mode=mode()
    if l:mode==#'n'
        return 'Normal'
    elseif l:mode==#'i'
        return 'Insert'
    elseif l:mode==#'R'
        return 'Replace'
    elseif l:mode==#'c'
        return 'Command'
    elseif l:mode==#'t'
        return 'Terminal'
    elseif l:mode==#'v'
        return 'Visual'
    elseif l:mode==#'V'
        return 'Visual-Line'
    else "if l:mode==#'^V' 此语句无法生效
        return 'Visual-Block'
    endif
endfunction
"得到当前缓冲区只读属性
function BufModifiable()
    if !(&modifiable)
        return ' RO '
    else
        return ''
    endif
endfunction
"得到当前缓冲区是否被修改属性
function BufModified()
    if !(&modifiable)
        return ''
    elseif !(&modified)
        return ''
    else
        return ' + '
    endif
endfunction
"得到当前缓冲区类型(文件类型/缓冲区类型)
function! BufType()
    if !empty(&filetype)
        return ' '.&filetype.' '
    elseif !empty(&buftype)
        return ' '.&buftype.' '
    else
        return ''
    endif
endfunction
"得到当前文件编码字符串
function! FileEncoding()
    if !empty(&fileencoding)
        return ' '.&fileencoding.' '
    else
        return ''
    endif
endfunction
"设置状态栏显示内容
"`%{n}*`:对其余的行使用高亮显示组User{n}，直到另一个%{n}*。
"数字{n}必须从1到9。用`%*`或`%0*`可以恢复正常的高亮显示。
set statusline =%1*\ %{BufMode()}\  "vim当前模式
set statusline+=%2*\ %<%F\  "路径
set statusline+=%3*%{BufModifiable()} "是否可修改
set statusline+=%4*%{BufModified()} "是否存在改动
set statusline+=%0*%=\  "右对齐并添加一个空格(防止后续格式因对齐被削去临接的空格，造成显示异常)
set statusline+=%5*%{BufType()} "文件类型
set statusline+=%6*\ %{&fileformat}\  "操作系统
set statusline+=%7*%{FileEncoding()} "文件编码
set statusline+=%8*\ %c:%l/%L\(%p%%)\  "光标所在位置
"statusline高亮配色
if has('gui_running')
    highlight User1 gui=bold guifg=White guibg=DarkGreen
    highlight User2 gui=bold guifg=White guibg=DarkBlue
    highlight User3 gui=bold guifg=White guibg=DarkGray
    highlight User4 gui=bold guifg=White guibg=Red
    highlight User5 gui=bold guifg=White guibg=Brown
    highlight User6 gui=bold guifg=White guibg=DarkMagenta
    highlight User7 gui=bold guifg=White guibg=DarkCyan
    highlight User8 gui=bold guifg=White guibg=DarkYellow
else
    highlight User1 cterm=bold ctermfg=White ctermbg=DarkGreen
    highlight User2 cterm=bold ctermfg=White ctermbg=DarkBlue
    highlight User3 cterm=bold ctermfg=White ctermbg=DarkGray
    highlight User4 cterm=bold ctermfg=White ctermbg=Red
    highlight User5 cterm=bold ctermfg=White ctermbg=Brown
    highlight User6 cterm=bold ctermfg=White ctermbg=DarkMagenta
    highlight User7 cterm=bold ctermfg=White ctermbg=DarkCyan
    highlight User8 cterm=bold ctermfg=White ctermbg=DarkYellow
endif

"信息栏相关
set ruler "显示光标所在位置
set showmode "显示当前模式
set showcmd "显示键入按键信息

"======================================
"gvim独有设置
"======================================

"打开gvim时最大化窗口
if has('gui_running')
    if has('win32')
        autocmd GUIEnter * simalt ~x
    else
        set lines=999 columns=999
    endif
endif

"gvim字体相关
"设置gvim显示字体为Consolas,字号为14号
if has('gui_running')
    if has('win32')||has('mac')||has('macunix')
        set guifont=Consolas:h14
    elseif has('linux')
        set guifont=Consolas\ 14
    endif
endif

"gvim gui菜单显示相关
if has('gui_running')
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

"为什么实现如下的功能，而不直接使用Netrw的`x`功能键的原因:
"在Vim/GVim 9.0版本中，在'win32'系统中使用`x`，无法打开/执行文件
"在Vim/GVim 9.1版本中，修复了这一问题
"所以为了适配'win32'系统Vim/GVim 9.0版本，实现如下功能作为`x`的代替
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
    "绑定Netrw打开文件的快捷键(gx)
    nnoremap <silent>gx :call OpenFileWithWindowsExplorer()<CR>
endif

"Netrw切换文件路径的时候是否保持原有的工作目录
"0:Netrw切换文件路径的时候，窗口的工作目录会自动更新为打开的文件路径
"1(默认):Netrw切换文件路径的时候，窗口的工作目录不会自动更新为打开的文件路径
let g:netrw_keepdir=0

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

"终端光标形状跟随vim模式自动切换(存在隐性BUG，有时会导致字符显示错误)
"实现效果：普通模式实心块状，插入模式线条状，替换模式下划线状
"&t_SI 表示插入模式
"&t_SR 表示替换模式
"&t_EI 表示普通模式
""\<Esc>[6 q"用来配置光标的形状，其中6的取值可以是1~6，分别指代不同的光标样式
"1:blinking block         闪烁的方块
"2:solid block            不闪烁的方块
"3:blinking underscore    闪烁的下划线
"4:solid underscore       不闪烁的下划线
"5:blinking vertical bar  闪烁的竖线
"6:solid vertical bar     不闪烁的竖线
"if has('win32')
"    let &t_SI = '\<Esc>[6 q'
"    let &t_SR = '\<Esc>[4 q'
"    let &t_EI = '\<Esc>[2 q'
"endif

"vim/gvim命令模式打开终端相关
"设置`:term[inal]`命令默认打开的终端
if has('win32')
    set shell=powershell "'win32'系统`shell`默认值为`cmd`
endif

"退出终端
"使用q!会把由此终端窗口打开的全部应用强制关闭之后再退出
"使用exit可以关闭此终端窗口，并在后台继续运行原先由此终端窗口打开的应用程序

"中文输入相关
"在vim中可以使用任何终端支持的输入法来输入中文
"在gvim中(windows操作系统)请使用windows自带输入法，使用其他输入法不一定能切换中英文并输入中文

"剪切板相关
"设置vim/gvim和系统的剪切板互通
set clipboard^=unnamed,unnamedplus

"======================================
"自定义快捷键
"======================================

"保存(ctrl+s)
nnoremap <silent><C-s> :w<CR>
inoremap <silent><C-s> <Esc>:w<CR>a
vnoremap <silent><C-s> <Esc><Esc>:w<CR>

"全选(ctrl+a)
nnoremap <silent><C-a> gg0vG$
inoremap <silent><C-a> <Esc>gg0vG$
vnoremap <silent><C-a> <Esc><Esc>gg0vG$

"复制当前行到下一行(ctrl+d)
nnoremap <silent><C-d> yyp
inoremap <silent><C-d> <Esc>yypa

"撤销(ctrl+z)
nnoremap <silent><C-z> u
inoremap <silent><C-z> <Esc>ua

"取消撤销(ctrl+y)
nnoremap <silent><C-y> <C-r>
inoremap <silent><C-y> <Esc><C-r>a

"强制关闭光标所在窗口(alt+w)
if has('mac')||has('macunix')
    nnoremap <silent><D-w> :q!<CR>
    inoremap <silent><D-w> <Esc>:q!<CR>
    vnoremap <silent><D-w> <Esc><Esc>:q!<CR>
elseif has('win32')
    nnoremap <silent><A-w> :q!<CR>
    inoremap <silent><A-w> <Esc>:q!<CR>
    vnoremap <silent><A-w> <Esc><Esc>:q!<CR>
else
    nnoremap <silent><M-w> :q!<CR>
    inoremap <silent><M-w> <Esc>:q!<CR>
    vnoremap <silent><M-w> <Esc><Esc>:q!<CR>
endif

"在当前窗口(分屏窗口)的下方打开一个新的终端窗口(分屏窗口)(ctrl+t)
nnoremap <silent><C-t> :belowright terminal<CR>
inoremap <silent><C-t> <Esc>:belowright terminal<CR>
vnoremap <silent><C-t> <Esc><Esc>:belowright terminal<CR>
"命令行模式，分屏窗口只显示终端(ctrl+t)
cnoremap <silent><C-t> :belowright terminal<CR><C-w>k:q!<CR>

"终端退出insert模式进入normal模式(Mac:Cmd|Win:Alt|Other:Meta-e)
if has('mac')||has('macunix')
    tnoremap <silent><D-e> <C-\><C-n>
elseif has('win32')
    tnoremap <silent><A-e> <C-\><C-n>
else
    tnoremap <silent><M-e> <C-\><C-n>
endif

"在当前窗口(分屏窗口)的左侧打开一个新的netrw窗口(分屏窗口)(ctrl+e)
nnoremap <silent><C-e> :Vexplore<CR>
inoremap <silent><C-e> <Esc>:Vexplore<CR>
vnoremap <silent><C-e> <Esc><Esc>:Vexplore<CR>
"命令行模式，分屏窗口只显示netrw(ctrl+e)
cnoremap <silent><C-e> :Explore<CR>

"open tab of fast grep(ctrl+g)
nnoremap <C-g> :tabnew<CR>:Explore<CR>:copen<CR>:vimgrep 
inoremap <C-g> <Esc>:tabnew<CR>:Explore<CR>:copen<CR>:vimgrep 
vnoremap <C-g> <Esc><Esc>:tabnew<CR>:Explore<CR>:copen<CR>:vimgrep 

"新增一空白行(o下方 O上方)
"原因是vim/gvim自带的o/O在有些情况下新增行会附带一些特殊格式/字符
"这里采用"_d命令删除（不存入剪切板），而不是d剪切，是为了保护剪切板中的内容
nnoremap <silent>o o<Esc>0"_d$a
nnoremap <silent>O O<Esc>0"_d$a

"删除可视模式中选中区域的所有换行，并将光标移动到该行行首
"an:remove all \n
vnoremap <silent>an :s/\n//g<CR>:nohlsearch<CR>0

"删除可视模式中选中区域的所有空行(包括只含有空格的行)
"al:remove all empty line
vnoremap <silent>al :g/^\s*$/d<CR>:nohlsearch<CR>

"删除可视模式中选中区域的所有空格
"as:remove all space
vnoremap <silent>as :s/\s//g<CR>:nohlsearch<CR>

"删除可视模式中选中区域的仅存在于行尾的空格
"at:remove all tail space
vnoremap <silent>at :s/\s\+$//g<CR>:nohlsearch<CR>

"删除可视模式中选中区域的仅存在于行首的空格
"ah:remove all head space
vnoremap <silent>ah :s/^\s\+//g<CR>:nohlsearch<CR>

"命令行模式粘贴(ctrl+r)
cnoremap <C-r> <C-r>*

"设置宏的时候删除原先记录的宏操作
nnoremap <silent>qa :let @a=''<CR>qa
nnoremap <silent>qb :let @b=''<CR>qb
nnoremap <silent>qc :let @c=''<CR>qc
nnoremap <silent>qd :let @d=''<CR>qd
nnoremap <silent>qe :let @e=''<CR>qe
nnoremap <silent>qf :let @f=''<CR>qf
nnoremap <silent>qg :let @g=''<CR>qg
nnoremap <silent>qh :let @h=''<CR>qh
nnoremap <silent>qi :let @i=''<CR>qi
nnoremap <silent>qj :let @j=''<CR>qj
nnoremap <silent>qk :let @k=''<CR>qk
nnoremap <silent>ql :let @l=''<CR>ql
nnoremap <silent>qm :let @m=''<CR>qm
nnoremap <silent>qn :let @n=''<CR>qn
nnoremap <silent>qo :let @o=''<CR>qo
nnoremap <silent>qp :let @p=''<CR>qp
nnoremap <silent>qq :let @q=''<CR>qq
nnoremap <silent>qr :let @r=''<CR>qr
nnoremap <silent>qs :let @s=''<CR>qs
nnoremap <silent>qt :let @t=''<CR>qt
nnoremap <silent>qu :let @u=''<CR>qu
nnoremap <silent>qv :let @v=''<CR>qv
nnoremap <silent>qw :let @w=''<CR>qw
nnoremap <silent>qx :let @x=''<CR>qx
nnoremap <silent>qy :let @y=''<CR>qy
nnoremap <silent>qz :let @z=''<CR>qz
nnoremap <silent>q0 :let @0=''<CR>q0
nnoremap <silent>q1 :let @1=''<CR>q1
nnoremap <silent>q2 :let @2=''<CR>q2
nnoremap <silent>q3 :let @3=''<CR>q3
nnoremap <silent>q4 :let @4=''<CR>q4
nnoremap <silent>q5 :let @5=''<CR>q5
nnoremap <silent>q6 :let @6=''<CR>q6
nnoremap <silent>q7 :let @7=''<CR>q7
nnoremap <silent>q8 :let @8=''<CR>q8
nnoremap <silent>q9 :let @9=''<CR>q9

"快捷切换分屏窗口(<Ctrl-*>代替<Ctrl-w>*)
"h 移动到左边的分屏窗口
"j 移动到下边的分屏窗口
"k 移动到上边的分屏窗口
"l 移动到右边的分屏窗口
"w 移动到下一个分屏窗口
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
nnoremap <silent><C-w> <C-w>w
inoremap <silent><C-h> <Esc><C-w>h
inoremap <silent><C-j> <Esc><C-w>j
inoremap <silent><C-k> <Esc><C-w>k
inoremap <silent><C-l> <Esc><C-w>l
inoremap <silent><C-w> <Esc><C-w>w
vnoremap <silent><C-h> <Esc><Esc><C-w>h<CR>
vnoremap <silent><C-j> <Esc><Esc><C-w>j<CR>
vnoremap <silent><C-k> <Esc><Esc><C-w>k<CR>
vnoremap <silent><C-l> <Esc><Esc><C-w>l<CR>
vnoremap <silent><C-w> <Esc><Esc><C-w>w<CR>
tnoremap <silent><C-h> <C-w>h
tnoremap <silent><C-j> <C-w>j
tnoremap <silent><C-k> <C-w>k
tnoremap <silent><C-l> <C-w>l
tnoremap <silent><C-w> <C-w>w

"快捷移动分屏窗口的位置(<(Mac:Cmd|Win:Alt|Other:Meta)-m>x代替<Ctrl-w>X)
"为什么不用<Ctrl-m>?
"原因：在Vim插入模式中输入回车<Enter>，会被率先匹配成<Ctrl-m>,即^M
"h 移动分屏窗口到左边
"j 移动分屏窗口到下边
"k 移动分屏窗口到上边
"l 移动分屏窗口到右边
if has('mac')||has('macunix')
    nnoremap <silent><D-m>h <C-w>H
    nnoremap <silent><D-m>j <C-w>J
    nnoremap <silent><D-m>k <C-w>K
    nnoremap <silent><D-m>l <C-w>L
    inoremap <silent><D-m>h <Esc><C-w>H
    inoremap <silent><D-m>j <Esc><C-w>J
    inoremap <silent><D-m>k <Esc><C-w>K
    inoremap <silent><D-m>l <Esc><C-w>L
    vnoremap <silent><D-m>h <Esc><Esc><C-w>H<CR>
    vnoremap <silent><D-m>j <Esc><Esc><C-w>J<CR>
    vnoremap <silent><D-m>k <Esc><Esc><C-w>K<CR>
    vnoremap <silent><D-m>l <Esc><Esc><C-w>L<CR>
    tnoremap <silent><D-m>h <C-w>H
    tnoremap <silent><D-m>j <C-w>J
    tnoremap <silent><D-m>k <C-w>K
    tnoremap <silent><D-m>l <C-w>L
elseif has('win32')
    nnoremap <silent><A-m>h <C-w>H
    nnoremap <silent><A-m>j <C-w>J
    nnoremap <silent><A-m>k <C-w>K
    nnoremap <silent><A-m>l <C-w>L
    inoremap <silent><A-m>h <Esc><C-w>H
    inoremap <silent><A-m>j <Esc><C-w>J
    inoremap <silent><A-m>k <Esc><C-w>K
    inoremap <silent><A-m>l <Esc><C-w>L
    vnoremap <silent><A-m>h <Esc><Esc><C-w>H<CR>
    vnoremap <silent><A-m>j <Esc><Esc><C-w>J<CR>
    vnoremap <silent><A-m>k <Esc><Esc><C-w>K<CR>
    vnoremap <silent><A-m>l <Esc><Esc><C-w>L<CR>
    tnoremap <silent><A-m>h <C-w>H
    tnoremap <silent><A-m>j <C-w>J
    tnoremap <silent><A-m>k <C-w>K
    tnoremap <silent><A-m>l <C-w>L
else
    nnoremap <silent><M-m>h <C-w>H
    nnoremap <silent><M-m>j <C-w>J
    nnoremap <silent><M-m>k <C-w>K
    nnoremap <silent><M-m>l <C-w>L
    inoremap <silent><M-m>h <Esc><C-w>H
    inoremap <silent><M-m>j <Esc><C-w>J
    inoremap <silent><M-m>k <Esc><C-w>K
    inoremap <silent><M-m>l <Esc><C-w>L
    vnoremap <silent><M-m>h <Esc><Esc><C-w>H<CR>
    vnoremap <silent><M-m>j <Esc><Esc><C-w>J<CR>
    vnoremap <silent><M-m>k <Esc><Esc><C-w>K<CR>
    vnoremap <silent><M-m>l <Esc><Esc><C-w>L<CR>
    tnoremap <silent><M-m>h <C-w>H
    tnoremap <silent><M-m>j <C-w>J
    tnoremap <silent><M-m>k <C-w>K
    tnoremap <silent><M-m>l <C-w>L
endif

"切换到下一个标签页
"(模仿VimiumC J)
"不使用gt的原因:gt不是按照标签页的序号跳转的，是按照标签页打开的顺序跳转的
function! TabNext()
    let l:tab_count=tabpagenr('$')
    if l:tab_count==1
        return
    endif
    let l:target_tab=tabpagenr()-1
    if l:target_tab<1
        let l:target_tab=l:tab_count
    endif
    execute 'silent '.l:target_tab.'tabnext'
endfunction
nnoremap <silent>J :call TabNext()<CR>
vnoremap <silent>J <Esc><Esc>:call TabNext()<CR>

"切换到上一个标签页
"(模仿VimiumC K)
"不使用gT的原因:gT不是按照标签页的序号跳转的，是按照标签页打开的顺序跳转的
function! TabPrev()
    let l:tab_count=tabpagenr('$')
    if l:tab_count==1
        return
    endif
    let l:target_tab=tabpagenr()+1
    if l:target_tab>l:tab_count
        let l:target_tab=1
    endif
    execute 'silent '.l:target_tab.'tabnext'
endfunction
nnoremap <silent>K :call TabPrev()<CR>
vnoremap <silent>K <Esc><Esc>:call TabPrev()<CR>

"让当前标签页在标签栏中向左移动一格(Tab+,)
"(模仿VimiumC <<):`shift ,`是`<`,替换`shift`为`Tab`
"不直接使用`tabmove -1`的原因:
"如果当前标签页是标签栏最左侧的标签页，`:tabmove -1`无法左移(循环左移)
function! TabMoveLeft()
    let l:tab_count=tabpagenr('$')
    if l:tab_count==1
        return
    endif
    let l:target_tab=tabpagenr()-1
    if l:target_tab<1
        execute 'silent tabmove +'.(l:tab_count-1)
    else
        execute 'silent tabmove -1'
    endif
endfunction
nnoremap <silent><Tab>, :call TabMoveLeft()<CR>
vnoremap <silent><Tab>, <Esc><Esc>:call TabMoveLeft()<CR>

"让当前标签页在标签栏中向有右移动一格(Tab+.)
"(模仿VimiumC >>):`shift .`是`>`,替换`shift`为`Tab`
"不直接使用`tabmove +1`的原因:
"如果当前标签页是标签栏最右侧的标签页，`:tabmove +1`无法右移(循环右移)
function! TabMoveRight()
    let l:tab_count=tabpagenr('$')
    if l:tab_count==1
        return
    endif
    let l:target_tab=tabpagenr()+1
    if l:target_tab>l:tab_count
        execute 'silent tabmove -'.(l:tab_count-1)
    else
        execute 'silent tabmove +1'
    endif
endfunction
nnoremap <silent><Tab>. :call TabMoveRight()<CR>
vnoremap <silent><Tab>. <Esc><Esc>:call TabMoveRight()<CR>

"后退(跳转到上一个文件编辑位置)
"(模仿VimiumC H)
nnoremap <silent>H <C-o>
vnoremap <silent>H <Esc><Esc><C-o>

"前进(跳转到下一个文件编辑位置)
"(模仿VimiumC L)
nnoremap <silent>L <C-i>
vnoremap <silent>L <Esc><Esc><C-i>

"新建一个空标签页(Tab+n)
nnoremap <silent><Tab>n :tabnew<CR>
vnoremap <silent><Tab>n <Esc><Esc>:tabnew<CR>

"新建一个netrw标签页(Tab+n)
nnoremap <silent><Tab>e :Texplore<CR>
vnoremap <silent><Tab>e <Esc><Esc>:Texplore<CR>

"新建一个终端标签页(Tab+n)
nnoremap <silent><Tab>t :tabnew<CR>:belowright terminal<CR><C-w>k:q!<CR>
vnoremap <silent><Tab>t <Esc><Esc>:tabnew<CR>:belowright terminal<CR><C-w>k:q!<CR>

"强制关闭当前标签页(Tab+c)
"不直接使用`:tabclose!`的原因:
"如果当前标签栏只有一个标签页，`:tabclose!`无法关闭该标签页
function! TabClose()
    let l:tab_count=tabpagenr('$')
    if l:tab_count>1
        execute 'silent tabclose!'
    else
        execute 'silent qa!'
    endif
endfunction
nnoremap <silent><Tab>c :call TabClose()<CR>
vnoremap <silent><Tab>c <Esc><Esc>:call TabClose()<CR>

"强制关闭当前标签页以外的全部标签页(Tab+o)
nnoremap <silent><Tab>o :tabonly!<CR>
vnoremap <silent><Tab>o <Esc><Esc>:tabonly!<CR>

"强制关闭全部标签页(Tab+a)
nnoremap <silent><Tab>a :qa!<CR>
vnoremap <silent><Tab>a <Esc><Esc>:qa!<CR>

"跳转到编号为<number>的标签页(Tab+<number>)
nnoremap <silent><Tab>1 :1 tabnext<CR>
nnoremap <silent><Tab>2 :2 tabnext<CR>
nnoremap <silent><Tab>3 :3 tabnext<CR>
nnoremap <silent><Tab>4 :4 tabnext<CR>
nnoremap <silent><Tab>5 :5 tabnext<CR>
nnoremap <silent><Tab>6 :6 tabnext<CR>
nnoremap <silent><Tab>7 :7 tabnext<CR>
nnoremap <silent><Tab>8 :8 tabnext<CR>
nnoremap <silent><Tab>9 :9 tabnext<CR>
nnoremap <silent><Tab>0 :10 tabnext<CR>
vnoremap <silent><Tab>1 <Esc><Esc>:1 tabnext<CR>
vnoremap <silent><Tab>2 <Esc><Esc>:2 tabnext<CR>
vnoremap <silent><Tab>3 <Esc><Esc>:3 tabnext<CR>
vnoremap <silent><Tab>4 <Esc><Esc>:4 tabnext<CR>
vnoremap <silent><Tab>5 <Esc><Esc>:5 tabnext<CR>
vnoremap <silent><Tab>6 <Esc><Esc>:6 tabnext<CR>
vnoremap <silent><Tab>7 <Esc><Esc>:7 tabnext<CR>
vnoremap <silent><Tab>8 <Esc><Esc>:8 tabnext<CR>
vnoremap <silent><Tab>9 <Esc><Esc>:9 tabnext<CR>
vnoremap <silent><Tab>0 <Esc><Esc>:10 tabnext<CR>

"关闭当前窗口的高亮显示(Esc)
nnoremap <silent><Esc> :nohlsearch<CR>

"======================================
"自动命令
"======================================

"某些配色方案下特殊字符tab(\t)/space(\s)/eol(\n\r)显示不明显
"将tab/space/eol的前景色统一设置为深灰色
function SetSpecialCharactersDarkGrey()
    if has('gui_running')
        highlight MyTabSpaceEol guifg=darkgrey
    else
        highlight MyTabSpaceEol ctermfg=darkgrey
    endif
    match MyTabSpaceEol /\t\|\s\|\n\|\r/
endfunction
call SetSpecialCharactersDarkGrey() "作用于初始窗口
autocmd WinEnter * call SetSpecialCharactersDarkGrey()

"切换当前窗口工作目录为当前打开的文件目录
function! LCdCurrentPath()
    execute 'silent lcd '.expand('%:p:h')
endfunction
"文件打开时自动切换当前窗口工作目录为文件父目录
autocmd BufEnter * :call LCdCurrentPath()

"文件缓冲区修改(仅适用于文本替换后)自动取消当前窗口的高亮显示
autocmd BufWrite * :nohlsearch

"修改本文件并保存后立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
