set nocompatible

" Vundle Package Management
    " Vundle Init.
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

" General Bundles (i.e. not programming specific).
    " Colors!
    Bundle 'altercation/vim-colors-solarized'
    " View open buffers in top of window.
    Bundle 'fholgado/minibufexpl.vim'
    " Full path fuzzy file, buffer, mru, tag, finder
    Bundle 'kien/ctrlp.vim'
    " Nerdtree!
    Bundle 'scrooloose/nerdtree'
    " Pretty status line
    Bundle 'Lokaltog/powerline'
    " Align Text
    Bundle 'godlygeek/tabular'
    " Delete all buffers except current
    Bundle 'duff/vim-bufonly'
    Bundle 'mhinz/vim-startify'

" Editing Bundles
    " Auto-close characters.
    Bundle 'Townk/vim-autoclose'
    " Super-tab for autocompletion
    Bundle 'ervandew/supertab'
    " Comment out blocks with \\ or
    Bundle 'tpope/vim-commentary'
    " Fix the '.' command for mappings.
    Bundle 'tpope/vim-repeat'
    " Edit surroundings. ds'=>'adw'->adw. cs(]=>(X)->[X],cs([=>(X)->[ X ]
    Bundle 'tpope/vim-surround'
    " Syntax highlighting for markdown.
    Bundle 'tpope/vim-markdown'

" Programming Bundles
    " Syntax checker
    Bundle 'scrooloose/syntastic'
    " " Snipmate and its dependencies
    Bundle 'vim-scripts/UltiSnips'
    " Press <F8> for list of tags in open files.
    Bundle 'majutsushi/tagbar'
    " Pipe text between screen/tmux sesions.
    Bundle 'jpalardy/vim-slime'

" General
    " Enable filetype plugin
    filetype plugin on
    filetype indent on
    " Set to auto read when a file is changed from the outside
    set autoread
    "Always show the status line.
    set laststatus=2
    " Hide the default mode text. I use powerline instead.
    set noshowmode
    " With a map leader it's possible to do extra key combinations.
    " For example, <leader>w saves the current file
    let mapleader = ","
    let g:mapleader = ","

    " Vim tags plugin will search up to the $HOME directory.
    set tags+=tags;$HOME

    " Remove any trailing whitespace that is in the file
    autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

    " Colour the 81 column
    set colorcolumn=81

" VIM user interface settings
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
    set tm=500

    set cul
    set showcmd

    set nonu
" Colors and Fonts
    syntax enable "Enable syntax hl

    " Update gnome color palete for compatability.
    " https://github.com/sigurdga/gnome-terminal-colors-solarized
    colorscheme solarized
    set t_Co=16
    set bg=light

    set encoding=utf-8
    try
        lang en_US
    catch
    endtry

    set ffs=unix,dos,mac "Default file types

" Files, backups and undo
    " Turn backup off, since most stuff is in SVN, git anyway...
    set nobackup
    set nowb
    set noswapfile
    " Sets how many lines of history VIM has to remember
    set history=700
    set cm=blowfish

" Text, tab and indent related
    set expandtab
    set shiftwidth=2
    set tabstop=2
    set smarttab

    set tw=80

    set ai "Auto indent
    set si "Smart indet
    set wrap "Wrap lines

" Key Mappings
    " Use Enter to add line below.
    nnoremap <CR> o<Esc>
    " Stop comment leader being inserted after 'o' or 'O' in normal mode.
    set formatoptions-=o

    " Map ctrl-movement keys to window switching
    map <C-k> <C-w><Up>
    map <C-j> <C-w><Down>
    map <C-l> <C-w><Right>
    map <C-h> <C-w><Left>

    " Map tab in normal mode to buffer switching.
    nnoremap <Tab> :bnext<CR>
    nnoremap <S-Tab> :bprev<CR>

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
        mks! ~/.vim/session/auto.vim
    endfunction

    autocmd VimLeave * call SaveSession()

    " Clear search history (i.e. stop highlights).
    nmap <silent> <leader><leader> :let @/=""<CR>

    " Center search on next item.
    nnoremap N Nzz
    nnoremap n nzz
    " Use jj to leave insert mode.
    inoremap jj <Esc>

    " Built in maps it is good to know.
    " <C-w>= or <C-w>| to equalise vertical/hozontal window size.

    " Overwrite protected file.
    cmap w!! call SudoWrite()
    function! SudoWrite()
      %!sudo tee > /dev/null %
      qall!
    endfunction

    " Insert single character
    :nmap <Space> i_<Esc>r

" Visual mode Search
    " Really useful!
    "  In visual mode when you press * or # to search for the current selection
    vnoremap <silent> * :call VisualSearch('f')<CR>
    vnoremap <silent> # :call VisualSearch('b')<CR>

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

" Spell checking
    "Pressing ss will toggle and untoggle spell checking
    nnoremap <leader>ss :setlocal spell!<cr>

    "Shortcuts using <leader>
    nnoremap <leader>sn ]s " Next wrong word.
    nnoremap <leader>sp [s " Prev wrong word.
    nnoremap <leader>sa zg " Add word to spellfile
    nnoremap <leader>s? z= " Suggest words.
    nnoremap <leader>sc z= " Suggest words.
    nnoremap <leader>sr zw " Remove the word from spellfile.

" Filetype settings
    " Scheme
    autocmd Filetype scheme set foldmethod=indent
    " Vim
    autocmd Filetype vim set foldmethod=indent
    " Latex
    autocmd Filetype tex set foldmethod=indent
    " Python
    autocmd Filetype python set shiftwidth=4
    autocmd Filetype python set tabstop=4
    " Markdown
    autocmd Filetype markdown set shiftwidth=4
    autocmd Filetype markdown set tabstop=4
    " Fuck plaintex
    let g:tex_flavor = "latex"

" Plugin Settings
    " Powerline
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    if ! has('gui_running')
        augroup FastEscape
            autocmd!
            au InsertEnter * set timeoutlen=200
            au InsertLeave * set timeoutlen=500
        augroup END
    endif

    " Mini-Buf Explorer
        map <leader>c :CMiniBufExplorer<cr>
        map <leader>u :UMiniBufExplorer<cr>
        map <leader>t :TMiniBufExplorer<cr>

    " NERDTree
        " Open nerdtree if just vim opened.
        " autocmd vimenter * if !argc() | NERDTree | endif
        " Close vim if only nerdtree open
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
        nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

    " Tag Browser (currently Tagbar)
        " Toggle tag browser with F8
        "nnoremap <silent> <F8> :TlistToggle<CR>
        nnoremap <silent> <F8> :TagbarToggle<CR>
        let g:tagbar_autoclose=1
        let g:tagbar_width = 30

    " Syntastic
      " By default, don't auto check files.
      " Use :SyntasticCheck to check the file.
      let g:syntastic_mode_map = { 'mode': 'passive',
                                 \ 'active_filetypes': [],
                                 \ 'passive_filetypes': [] }

    " Slime
      let g:slime_target = "tmux"
