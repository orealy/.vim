To start, make a symlink in your home directory to the vimrc.
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

Done.
