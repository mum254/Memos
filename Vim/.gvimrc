set nocompatible
filetype off

if has('vim_starting')
	" 初回起動時のみruntimepathにneobundleのパスを指定する
	set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))
" インストールするプラグインをここに記述
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'
call neobundle#end()
" ファイルタイプ別のプラグイン/インデントを有効にする

filetype plugin indent on

"------------------------------------------------------------
"" jedi-vim Setting

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"------------------------------------------------------------

let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*' 


set nobackup												"~の作成無効化
set writebackup											"上書き成功時に~を削除
set guioptions+=a										"クリップボードを共有(gvim用)
set clipboard+=unnamed,autoselect		"クリップボードを共有
set clipboard=unnamedplus						"クリップボードを共有
"set spelllang=+cjk
"set spell

"** 文字コード設定 **
set encoding=utf-8									"vim
set fileencoding=utf-8							"保存するファイル
set termencoding=utf-8							"開くファイル

"** 表示設定 **
syntax on														"ハイライト表示
set number													"タイトル
set title														"行番号

"** カラースキーマ設定 **
set t_Co=256
colorscheme molokai
let g:molokai_original=1
set background=dark
"highlight Comment ctermfg=LightCyan 

set tabstop=2
set shiftwidth=2										"インデント幅
set smartindent											"挿入モードでタブ文字有効
set smarttab
	
"** insertモードから抜ける **
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
inoremap <silent> hh <ESC>

"** 挿入モードでのカーソル移動
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"ESCでIMEを確実に解除
inoremap <silent> <ESC> <ESC>:call ForceImeOff()<CR>
function! ForceImeOff()
	let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
endfunction
"
"** ノーマルモードでのカーソル移動
"nnoremap <S-h> ^
"nnoremap <S-j> )
"nnoremap <S-k> (
"nnoremap <S-l> $

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

"** python **
let g:python_highlight_all = 1

"** Vim-LaTeX **
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = 'xdg-open'
let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
"let g:Tex_ViewRule_pdf = 'zathura -s -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'texworks'
"let g:Tex_ViewRule_pdf = 'mupdf'
"let g:Tex_ViewRule_pdf = 'firefox -new-window'
"let g:Tex_ViewRule_pdf = 'chromium --new-window'


