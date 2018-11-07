""""""" Plugin management stuff """""""
set nocompatible
filetype off

:set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
:autocmd OptionSet guicursor noautocmd set guicursor=

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'brooth/far.vim'
Plug 'neomake/neomake'
Plug 'rking/ag.vim'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'vifm/neovim-vifm'
call plug#end()

nnoremap <C-p> :FZF<CR>

""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

"call SuperTabChain(Completefunc, '<c-n>')

"let g:SuperTabCompletionContexts = ['g:ContextText2']


""""""" General coding stuff """""""
" Highlight 80th column
set colorcolumn=80
" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000
" Set Command preview
set inccommand=split


""""""" Python stuff """""""
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1


""""""" Keybindings """""""
" Set up leaders
let mapleader=","
let maplocalleader="\\"

" Linux / windows ctrl+backspace ctrl+delete
" Note that ctrl+backspace doesn't work in Linux, so ctrl+\ is also available
imap <C-\> ú
imap <C-delete> ø

" Neomake and other build commands (ctrl-b)
nnoremap <C-b> :w<cr>:Neomake<cr>

autocmd BufNewFile,BufRead *.tex,*.bib noremap <buffer> <C-b> :w<cr>:new<bar>r !make<cr>:setlocal buftype=nofile<cr>:setlocal bufhidden=hide<cr>:setlocal noswapfile<cr>
autocmd BufNewFile,BufRead *.tex,*.bib imap <buffer> <C-b> <Esc><C-b>

" Python Plugin
let g:python_host_prog = '/home/patymori/.pyenv/versions/tools2/bin/python'
let g:python3_host_prog = '/home/patymori/.pyenv/versions/tools3/bin/python'

