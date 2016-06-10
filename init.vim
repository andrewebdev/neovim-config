set nocompatible
set encoding=utf-8

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'benekastah/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-grepper'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'fatih/vim-go'
Plug 'https://github.com/Shougo/deoplete.nvim.git'

call plug#end()

" Put your non-Plugin stuff after this line

" Show the safe character limit
" This should be done BEFORE setting the colour scheme
let &colorcolumn=join(range(80,80),",")
highlight ColorColumn guibg=#111111
highlight ColorColumn ctermbg=255


" Set a default colorscheme
" set t_Co=256
" colorscheme Tomorrow
" colorscheme Tomorrow-Night
" colorscheme soda
" colorscheme apprentice
colorscheme hybrid_material


" faster redraw
set ttyfast

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed


" Rebind <Leader> key
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quick quit command
noremap <Leader>q :quit<CR>  " quit current window
noremap <Leader>Q :qa!<CR>   " quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list


" Showing line numbers and length
set relativenumber  " relative line numbers
set number  " show line numbers
set tw=80   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700
nnoremap j gj
nnoremap k gk
noremap <F1> <Esc>


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Space vs Tab Switching
" Some people and projects insist on tabs however, so this
" will enable it for the session again
map <Leader>t :set noet ci pi sts=0<CR>

" This will set it back to spaces
map <Leader>s :set et noci nopi sts=4<CR>


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Syntax highligting
syntax on


" Hide the mouse when typing text
set mousehide


" ============================================================================
" Plugins Setup
" ============================================================================

" NerdTree
map <F9> :NERDTree<CR>


" vim-airline settings
let g:airline_powerline_fonts = 1


" Neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8']


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/venv/*


" Settings for Jedi-Vim
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#usages_command = "<leader>N"

" Settings for python-mode
" disable rope since we use jedi
let pymode_rope = 0
let ropevim_enable_shortcuts = 0
let g:pymode_breakpoint = 0
let g:pymode_motion = 0
let g:pymode_syntax = 0
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_lint_on_write = 0

" Emmet
" Only use emmet in html and css files
let g:user_emmet_install_global = 0
autocmd FileType xhtml,html,htmldjango,css,less EmmetInstall

" deoplete
let g:deoplete#enable_at_startup = 1

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Custom function to change 2 space indent to 4
function NewIndent()
    " Set every 2 spaces to a tab Character
    set ts=2 sts=2 noet
    retab!

    " Change every tab back to 4 spaces
    set ts=4 sts=4 et
    retab
endfunction


" Override indentation for yaml files
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
