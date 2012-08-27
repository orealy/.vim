To start, make a symlink in your home directory to the vimrc.
> ln -s ~/.vimrc ~/.vim/vimrc

Next, you need to checkout the package management system.
> git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Now install the bundles:
> vim +BundleInstall +qall

or in vim:
> :BundleInstall

Done.
