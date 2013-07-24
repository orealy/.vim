set nocompatible
" let loaded_matchparen = 1 " Stop paren matching, which lags when scrolling

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
    " Full path fuzzy file, buffer, mru, tag, finder
    Bundle 'Shougo/unite.vim'
    Bundle 'Shougo/vimproc.vim'
    " Pretty status line
	Bundle 'Lokaltog/powerline'
    " Delete all buffers except current with :BufOnly
    Bundle 'duff/vim-bufonly'
    " Give non-useless start-screen
    Bundle 'mhinz/vim-startify'
    " Align Text
    " Bundle 'godlygeek/tabular'
    " Bundle 'dhruvasagar/vim-table-mode'

" Editing Bundles
    " Auto-close characters.
    Bundle 'Raimondi/delimitMate'
    " Comment out blocks with \\ or
    Bundle 'tpope/vim-commentary'
    " Fix the '.' command for mappings.
    Bundle 'tpope/vim-repeat'
    " Edit surroundings. ds'=>'adw'->adw. cs(]=>(X)->[X],cs([=>(X)->[ X ]
    Bundle 'tpope/vim-surround'
    " Syntax highlighting for markdown.
    Bundle 'tpope/vim-markdown'
    " Multiple Cursors
    Bundle 'terryma/vim-multiple-cursors'
    " Create scratch with :Scratch
    Bundle 'duff/vim-scratch'

" Programming Bundles
    " Word completion
    Bundle 'Valloric/YouCompleteMe'
    " Syntax checker
    Bundle 'scrooloose/syntastic'
    " Snipmate and its dependencies
    Bundle 'SirVer/ultisnips'
    " Press <F8> for list of tags in open files.
    Bundle 'majutsushi/tagbar'
    " Pipe text between screen/tmux sesions.
    Bundle 'jpalardy/vim-slime'
    Bundle 'LaTeX-Box-Team/LaTeX-Box'
    " Javascrip indentation
    Bundle 'pangloss/vim-javascript'

"General
    " Enable filetype plugin
    filetype plugin on
    filetype indent on
    " Set to auto read when a file is changed from the outside
    set autoread
    " With a map leader it's possible to do extra key combinations.
    " For example, <leader>w saves the current file
    let mapleader = ","
    let maplocalleader = ","
    let g:mapleader = ","

    " Vim tags plugin will search up to the $HOME directory.
    set tags+=tags;$HOME

    " Remove any trailing whitespace that is in the file on save
    augroup clearwhitespace
        autocmd!
        autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge |endif
    augroup END

" VIM user interface settings
    set so=7 " Set 7 lines to the curors - when moving vertical.
    set ruler "Always show current position
    set cmdheight=2 "The commandbar height
    set hid "Don't close buffer when you abandon it
    set backspace=eol,start,indent " Set backspace config
    set whichwrap+=<,>,h,l
    "Ignore case when searching, unless using uppercase
    set ignorecase
    set smartcase
    set hlsearch "Highlight search things
    set incsearch "Make search act like search in modern browsers
    set lazyredraw "Don't redraw while executing macros
    set magic "Set magic on, for regular expressions
    set mat=2 "How many tenths of a second to blink
    set tm=500
    " Open all folds initially
    set foldmethod=indent
    set foldlevelstart=99
    set scrolloff=10 " limit # of lines above or below cursor
    set noerrorbells " No sound on errors
    set showcmd " show partial command as you type
    set number " show line number on left

    set wildmenu "Turn on wild menu, tab to go through completion options
    set wildmode=longest,list,full
    set wildignore+=*.aux,*.out,*.toc " Latex intermediate files
    set wildignore+=.hg,.git,.svn "Version control

    " Splits appear in a sensible place
    set splitbelow
    set splitright

" Colors and Fonts
    syntax enable "Enable syntax hl

    " Update gnome color palete for compatability.
    " https://github.com/sigurdga/gnome-terminal-colors-solarized
    colorscheme solarized
    set t_Co=16 " Number of colours
    set background=dark

    set encoding=utf-8
    try
        lang en_US
    catch
    endtry

    set fileformats=unix,dos,mac "Default file types

" Files, backups and undo
    " Turn backup off, since most stuff is in SVN, git anyway...
    set nobackup
    set nowb
    set noswapfile
    " Sets how many lines of history VIM has to remember
    set history=700
    " set encrypt method
    set cm=blowfish

" Text, tab and indent related
    set smarttab
    set expandtab
    set shiftwidth=4
    set tabstop=4

    set textwidth=74
    " Add to textwidth
    set colorcolumn=+1

    set ai "Auto indent
    set si "Smart indet
    set wrap "Wrap lines

" Key Mappings
    " move down a wrapped line
    nnoremap j gj
    nnoremap k gk
    " Use Enter to add line below from normal mode.
    nnoremap <CR> o<Esc>
    " Stop comment being inserted after 'o' or 'O' in normal mode.
    set formatoptions=tcq

    " Useless default mappings
    nnoremap <F1> <nop>
    nnoremap Q <nop>
    nnoremap K <nop>

    " Yank from the cursor to the end of the line, like C and D
    nnoremap Y y$

    " Use <C-(dir) to move between vim windows or tmux
    if exists('$TMUX')
      function! TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        execute "wincmd " . a:wincmd
        if previous_winnr == winnr()
          " The sleep and & gives time to get back to vim so tmux's focus tracking
          " can kick in and send us our ^[[O
          execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
          redraw!
        endif
      endfunction
      let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
      let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
      let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
      nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
      nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
      nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
      nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
    else
      nnoremap <C-h> <C-w>h
      nnoremap <C-j> <C-w>j
      nnoremap <C-k> <C-w>k
      nnoremap <C-l> <C-w>l
    endif


    " Map tab in normal mode to buffer switching.
    nnoremap <Tab> :bnext<CR>
    nnoremap <S-Tab> :bprev<CR>

    " Destroy all others.
    nnoremap <silent> <leader>da :BufOnly<CR>
    " Destroy without mercy!
    nnoremap <silent> <leader>x :bd!<CR>

    " Save entire session on exit. 'vim -S ~/.vim/session/auto.vim' to
    " restore.
    function! SaveSession()
        mks! ~/.vim/session/auto.vim
    endfunction
    augroup savesession
        autocmd!
        autocmd VimLeave * call SaveSession()
    augroup END

    " Clear search history (i.e. stop highlights) with <leader><leader>
    nnoremap <silent> <leader><leader> :let @/=""<CR>

    " Center search on next item.
    nnoremap N Nzz
    nnoremap n nzz
    " Use jj to leave insert mode.
    inoremap jj <Esc>

    " Overwrite protected file.
    cmap w!! call SudoWrite()
    function! SudoWrite()
      %!sudo tee > /dev/null %
      qall!
    endfunction

    " Insert single character
    nnoremap <Space> i<Space><Esc>r

    " Make current window the only window.
    nnoremap <Leader>o :only<cr>

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

" Global Filetype settings
    " Fuck plaintex
    let g:tex_flavor = "latex"

" Plugin Settings
    "Unite
        let g:unite_source_grep_command = 'ack-grep'
        let g:unite_source_grep_default_opts =
            \ '--column --no-color --nogroup --with-filename'
        let g:unite_source_grep_recursive_opt = ''
        " nno <leader>a :<C-u>Unite grep -start-insert
        "     \ -default-action=above -auto-resize -auto-preview file<CR>
        " nno <leader>A :<C-u>execute 'Unite grep:.::' . expand("<cword>")
        "     \ . ' -default-action=above -auto-preview'<CR>
        nno <leader>b :Unite -buffer-name=buffers
            \ -quick-match buffer<cr>
        "-auto-resize -buffer-name=buffers
        "   \ -start-insert -quick-match<CR>
        nno <c-p> :Unite file_rec/async -start-insert<cr>
        " nno <c-l> :Unite -start-insert -auto-resize -buffer-name=line line<cr>

        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#sorter_default#use(['sorter_rank'])

        let g:unite_source_history_yank_enable = 1
        nno <leader>y :Unite history/yank -auto-resize<cr>
        let g:ycm_filetype_specific_completion_to_disable = {"unite":1}

    " Powerline
        set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
        if ! has('gui_running')
            augroup FastEscape
                autocmd!
                au InsertEnter * set timeoutlen=200
                au InsertLeave * set timeoutlen=500
            augroup END
        endif
        " Powerline displays the status.
        set laststatus=2 "Always show the status line.
        set noshowmode " I use powerline instead.
        exec "python import vim, os, sys"
        exec "python sys.path.append('" . $HOME
            \ . "/.vim/powerline-settings/matchers')"
        let g:powerline_config_path = expand("~/.vim/powerline-settings")

    " Syntastic
        " By default, don't auto check files.
        " Use :SyntasticCheck to check the file.
        let g:syntastic_mode_map = { 'mode': 'passive',
                                    \ 'active_filetypes': [],
                                    \ 'passive_filetypes': [] }

    " Slime
        let g:slime_target = "tmux"

    " Startify
        let g:startify_show_files_number = 5

    " Ultisnips integration with YCM
        let g:UltiSnipsExpandTrigger="<c-j>"
        let g:UltiSnipsJumpForwardTrigger="<c-j>"
        let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    " Latexbox options
        let g:LatexBox_split_side="rightbelow"
        let g:LatexBox_Folding=1
