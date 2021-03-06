Installing
----------

What are you installing? This vim configuration, the plugins and powerline.

-o start, make a symlink in your home directory to the vimrc.
> ln -s ~/.vimrc ~/.vim/vimrc

Next, you need to checkout the package management system.
> git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Now install the bundles:
> vim +BundleInstall +qall

or in vim:
> :BundleInstall

To get command-t working:
> cd ~/.vim/bundle/Command-t/ruby/command-t
> ruby extconf.rb
> make

Powerline requires some installation. UTF-8 support for terminal etc. See the
documentation. I need to run this command sometimes when it updates.
> pip install --user -U git+git://github.com/Lokaltog/powerline

Compiling
---------

Several packages need to be compiled. See their docs for details.

* YouCompleteMe
* Vimproc
* Unite

Terminal
--------

What terminal, color scheme, shell, font do I run with this?

* Color Scheme - Solarized Dark.
* Terminal - Konsole. Make sure to remove the tabs, and change the theme to
  solarized dark.
* Shell - Zsh, specifically Oh-My-Zsh with the agnoster theme and powerline
* Font - Source Code Pro for Powerline size 10 (SCP patched with powerline
  symbols).  See https://github.com/Lokaltog/powerline-fonts and the powerline
  docs for info on installation. I choose SCP because I think it has the best
  patched symbols, and I choose size 10 because then a half window terminal
  fits 85 characters.


Shell aliases
------------

Load the previous session of vim.
alias vims='vim -S ~/.vim/sessions/auto.vim'

Windows
-------

Needed to install replace powerline with this one:
https://github.com/ashwin/vim-powerline and follow this guys instructions:
http://codejury.com/consolas-font-in-vim-powerline-windows/.

Also needed to install msysgit for vundle to work:
https://github.com/gmarik/vundle/wiki/Vundle-for-Windows

Done.
