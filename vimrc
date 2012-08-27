set nocompatible
" Vundle Package Management
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of
"                        unused bundles
" see :h vundle for more details or wiki for FAQ

Bundle 'gmarik/vundle'
" My Bundles
" Colors!
Bundle 'altercation/vim-colors-solarized'
" Press <F8> for list of tags in open files.
Bundle 'majutsushi/tagbar'
"Bundle 'taglist.vim'
" View open buffers in top of window.
Bundle 'git://github.com/fholgado/minibufexpl.vim.git'
" Search files in directory. Need to compile it first: > cd
" ~/.vim/bundle/command-t/ruby/command-t > ruby extconf.rb > make
Bundle 'git://git.wincent.com/command-t.git'
" Snipmate and its dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
" Swith to alternate files.
Bundle 'a.vim'
" Edit surroundings.
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
" Comment out blocks with \\ or
Bundle 'tpope/vim-commentary'
" Nerdtree!
Bundle 'scrooloose/nerdtree'
" Vim-latex
"Bundle 'jcf/vim-latex'
" Super-tab
Bundle 'ervandew/supertab'
" Syntax checker
Bundle 'scrooloose/syntastic'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
" Enable filetype plugin
filetype plugin on
filetype indent on
" Set to auto read when a file is changed from the outside
set autoread
" With a map leader it's possible to do extra key combinations like <leader>w
" saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7 " Set 7 lines to the curors - when moving vertical.
set wildmenu "Turn on WiLd menu
set ruler "Always show current position
set cmdheight=2 "The commandbar height
set hid "Change buffer - without saving
set backspace=eol,start,indent " Set backspace config
set whichwrap+=<,>,h,l
set ignorecase "Ignore case when searching
set smartcase
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros
set magic "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink
" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Update gnome color palete for compatability.
" https://github.com/sigurdga/gnome-terminal-colors-solarized
" Also added this prompt (needs to be bold)
" PS1='\[\e[1;39m\]\u:\w$\[\e[1;37m\] '
colorscheme solarized
set t_Co=16
set bg=dark

set nonu

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set tw=80

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call visualsearch('gv')<cr>
" map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s " Next wrong word.
map <leader>sp [s " Prev wrong word.
map <leader>sa zg " Add word to spellfile
map <leader>s? z= " Suggest words.
map <leader>sr zw " Remove the word from spellfile.

""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 12
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>

""""""""""""""""""""""""""""""
" => Mini-Buf Explorer
""""""""""""""""""""""""""""""
map <leader>c :CMiniBufExplorer<cr>
map <leader>u :UMiniBufExplorer<cr>
map <leader>t :TMiniBufExplorer<cr>

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
" Open nerdtree if just vim opened.
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" => Tag Browser (currently Tagbar)
""""""""""""""""""""""""""""""
" Toggle tag browser with F8
"nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_width = 30

""""""""""""""""""""""""""""""
" => Vim-Latex
""""""""""""""""""""""""""""""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Personal Prefs (and stuff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save that extra Ctrl
nore ; :

" Use Enter/Shift-enter to add line below/above.
nnoremap <CR> o<Esc>
" TERMINAL STEALS ME!
nnoremap <S-CR> O<Esc>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Map tab in normal mode to buffer switching.
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
" nmap <C-S-l> :bprev<CR>

" Destroy buffer with hotkey.
nnoremap <silent> <leader>d :bdelete<CR><S-Tab><Tab>
" Destory all others.
nnoremap <silent> <leader>da :BufOnly<CR>

" Quit all, but save to session default first.
nmap <leader>qa :call SaveAndExit()<CR>
function! SaveAndExit()
    call SaveSession()
    qall
endfunction

" Save entire session.
nmap <silent> <leader>wa :call SaveSession()<CR>
function! SaveSession()
    mks! ~/.vim/sessions/session.vim
endfunction

" Vim tags plugin will search up to the $HOME directory.
set tags+=tags;$HOME

nmap <silent> <leader><leader> :let @/=""<CR>

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

set cul
set showcmd
nnoremap N Nzz
nnoremap n nzz
inoremap jj <Esc>
