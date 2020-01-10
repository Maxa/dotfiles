" ~/.vimrc

" Show TAB, EOL
set list
set listchars=tab:>.,eol:\\

" Show line number, ruler
set number
set ruler

syntax on
"set modeline
filetype plugin on

" Colors for vimdiff
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
