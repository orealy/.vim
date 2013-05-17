let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-Tab> =UltiSnips_ListSnippets()
nmap v <Plug>SlimeConfig
nmap  <Plug>SlimeParagraphSend
xmap  <Plug>SlimeRegionSend
noremap  <Left>
xnoremap 	 :call UltiSnips_SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips_ExpandSnippet()
nnoremap 	 :bnext
snoremap <silent> <NL> :call UltiSnips_JumpForwards()
nnoremap <NL> <Down>
xnoremap <NL> <Down>
onoremap <NL> <Down>
snoremap <silent>  :call UltiSnips_JumpBackwards()
nnoremap  <Up>
xnoremap  <Up>
onoremap  <Up>
noremap  <Right>
nnoremap  o
nnoremap <silent>  :CtrlP
nnoremap   i_r
vnoremap <silent> # :call VisualSearch('b')
vnoremap <silent> * :call VisualSearch('f')
map ,mq <Plug>MBEMarkCurrent
map ,mbt <Plug>TMiniBufExplorer
map ,mbu <Plug>UMiniBufExplorer
map ,mbc <Plug>CMiniBufExplorer
map ,mbe <Plug>MiniBufExplorer
nnoremap <silent> ,nt :NERDTreeToggle
noremap ,t :TMiniBufExplorer
noremap ,u :UMiniBufExplorer
noremap ,c :CMiniBufExplorer
nnoremap ,sr zw " Remove the word from spellfile.
nnoremap ,sc z= " Suggest words.
nnoremap ,s? z= " Suggest words.
nnoremap ,sa zg " Add word to spellfile
nnoremap ,sp [s " Prev wrong word.
nnoremap ,sn ]s " Next wrong word.
nnoremap ,ss :setlocal spell!
nnoremap <silent> ,, :let @/=""
nnoremap <silent> ,wa :call SaveSession()
nnoremap ,qa :call SaveAndExit()
nnoremap <silent> ,da :BufOnly
nnoremap <silent> ,d :bdelete<S-Tab>	
nnoremap N Nzz
xmap S <Plug>VSurround
nmap \\u <Plug>CommentaryUndo
nmap \\\ <Plug>CommentaryLine
nmap \\ <Plug>Commentary
xmap \\ <Plug>Commentary
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nmap gcu <Plug>CommentaryUndo
nmap gcc <Plug>CommentaryLine
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
nnoremap n nzz
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
snoremap <silent> <BS> c
snoremap <silent> <C-Tab> :call UltiSnips_ListSnippets()
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <F8> :TagbarToggle
nnoremap <S-Tab> :bprev
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =UltiSnips_ExpandSnippet()
inoremap <silent> <NL> =UltiSnips_JumpForwards()
inoremap <silent>  =UltiSnips_JumpBackwards()
imap  <Plug>Isurround
imap <silent> [6~ <PageDown>
imap <silent> [5~ <PageUp>
imap <silent> OF <End>
imap <silent> OH <Home>
imap <silent> OD <Left>
imap <silent> OC <Right>
imap <silent> OB <Down>
imap <silent> OA <Up>
inoremap jj 
cmap w!! call SudoWrite()
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set backspace=eol,start,indent
set cmdheight=2
set cryptmethod=blowfish
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set helplang=en
set hidden
set history=700
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchtime=2
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim/bundle/vundle,~/.vim/bundle/vim-colors-solarized,~/.vim/bundle/minibufexpl.vim,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/powerline,~/.vim/bundle/tabular,~/.vim/bundle/vim-bufonly,~/.vim/bundle/vim-startify,~/.vim/bundle/vim-autoclose,~/.vim/bundle/YouCompleteMe,~/.vim/bundle/vim-commentary,~/.vim/bundle/vim-repeat,~/.vim/bundle/vim-surround,~/.vim/bundle/vim-markdown,~/.vim/bundle/syntastic,~/.vim/bundle/UltiSnips,~/.vim/bundle/tagbar,~/.vim/bundle/vim-slime,~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/vundle/,~/.vim/bundle/vundle/after,~/.vim/bundle/vim-colors-solarized/after,~/.vim/bundle/minibufexpl.vim/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bundle/nerdtree/after,~/.vim/bundle/powerline/after,~/.vim/bundle/tabular/after,~/.vim/bundle/vim-bufonly/after,~/.vim/bundle/vim-startify/after,~/.vim/bundle/vim-autoclose/after,~/.vim/bundle/YouCompleteMe/after,~/.vim/bundle/vim-commentary/after,~/.vim/bundle/vim-repeat/after,~/.vim/bundle/vim-surround/after,~/.vim/bundle/vim-markdown/after,~/.vim/bundle/syntastic/after,~/.vim/bundle/UltiSnips/after,~/.vim/bundle/tagbar/after,~/.vim/bundle/vim-slime/after,~/.vim/bundle/powerline/powerline/bindings/vim
set scrolloff=7
set shiftwidth=2
set showcmd
set showmatch
set noshowmode
set smartcase
set smartindent
set smarttab
set statusline=%!PowerlineNew()
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set tabstop=2
set tags=./tags,./TAGS,tags,TAGS,tags;/home/chris
set textwidth=74
set timeoutlen=500
set updatetime=300
set whichwrap=b,s,<,>,h,l
set wildmenu
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.vim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 .gitignore
args .gitignore
edit .gitignore
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
xnoremap <buffer> <silent> ,a} `>a}`<i{
xnoremap <buffer> <silent> ,a{ `>a}`<i{
xnoremap <buffer> <silent> ,a) `>a)`<i(
xnoremap <buffer> <silent> ,a( `>a)`<i(
xnoremap <buffer> <silent> ,a' `>a'`<i'
xnoremap <buffer> <silent> ,a] `>a]`<i[
xnoremap <buffer> <silent> ,a[ `>a]`<i[
xnoremap <buffer> <silent> ,a" `>a"`<i"
xnoremap <buffer> <silent> ,a` `>a``<i`
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=75
setlocal colorcolumn=75
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!Powerline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=74
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 2 - ((1 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
