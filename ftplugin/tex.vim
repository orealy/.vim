set shiftwidth=2
set tabstop=2

set makeprg=latexmk
set autowrite
nnoremap <buffer> <leader>m :make -pdf %<CR>
