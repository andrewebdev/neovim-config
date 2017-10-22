" Plugins
call plug#begin('~/.config/nvim/plugged')

" Utility
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'Shougo/denite.nvim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'vimwiki/vimwiki'

" NerdTree
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Coding
Plug 'davidhalter/jedi-vim'
" Plug 'klen/python-mode'
Plug 'fatih/vim-go'
Plug 'https://github.com/Shougo/deoplete.nvim.git'

" Syntax, colors and overall look
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate'
Plug 'flazz/vim-colorschemes'
Plug 'mhinz/vim-janah'
" Highlight html tags
Plug 'valloric/MatchTagAlways'

call plug#end()

" Put your non-Plugin stuff after this line
set nocompatible
scriptencoding utf8
set encoding=utf-8

" This should be done BEFORE setting the colour scheme
set termguicolors  " enable true colour in neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Show the safe character limit
let &colorcolumn=join(range(80,80),",")
highlight ColorColumn guibg=#111111
highlight ColorColumn ctermbg=255

" Set a default colorscheme
" colorscheme Tomorrow
" colorscheme Tomorrow-Night
" colorscheme soda
" autocmd ColorScheme janah highlight Normal ctermbg=235
" colorscheme janah
colorscheme leya


" faster redraw
set ttyfast

" Set scrollback limit
set scrollback=1

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard+=unnamed


" Rebind <Leader> key
let mapleader = ","

" Turn of ex mode
nnoremap Q <nop>

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
map <Leader>n :tabprevious<CR>
map <Leader>m :tabnext<CR>


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

" Automatic spell checking in markdown files
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell

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

" Maximize current window split
noremap <c-o> <c-w>_ <c-w>\|
" Getting back to normal is simple enough with <c-w>=
" So I'm not mapping a shortcut for that

" Shortcut to run a command using args on the current line, and paste
" the output dirjctly into the current buffer
noremap <leader>r !!$SHELL<cr>

" Global wildignore rules
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/venv/*
set wildignore+=*/nginx/*
set wildignore+=*/venv.*
set wildignore+=*/__pycache__/*


" ============================================================================
" Plugins Setup
" ============================================================================

" VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki_html/'}]


" NerdTree
map <F9> :NERDTree<CR>
let g:NERDTreeRespectWildIgnore = 1

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0


" Neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8']


" Denite
nnoremap <leader>f :Denite -mode=normal file<cr>
nnoremap <leader>F :Denite -mode=normal file_rec<cr>
nnoremap <leader>b :Denite -mode=normal buffer<cr>
nnoremap <leader>M :Denite -mode=normal menu<cr>

" Denite - Options
call denite#custom#option('default', {'prompt': '❯'})
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'None')

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \['--vimgrep', '--no-heading'])
else
  call denite#custom#var('file_rec', 'command',
        \['ag', '--nofollow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \['.git/', '.ropeproject/', '__pycache__/', '*.pyc', 'venv/', '*.min.*',
      \ 'bower_components/', 'node_modules/'])


" Denite - Mappings
call denite#custom#map(
    \'insert',
    \'<Esc>',
    \'<denite:enter_mode:normal>',
    \'noremap')
call denite#custom#map(
    \'normal',
    \'<Esc>',
    \'<NOP>',
    \'noremap')
call denite#custom#map(
    \'insert',
    \'<C-v>',
    \'<denite:do_action:vsplit>',
    \'noremap')
call denite#custom#map(
    \'normal',
    \'<C-v>',
    \'<denite:do_action:vsplit>',
    \'noremap')
call denite#custom#map(
    \'insert',
    \'<C-j>',
    \'<denite:move_to_next_line>',
    \'noremap')
call denite#custom#map(
    \'insert',
    \'<C-k>',
    \'<denite:move_to_previous_line>',
    \'noremap')

" Denite - Menus
let s:menus = {}
let s:menus.configs = {'description': 'Configs and temp files'}
let s:menus.configs.file_candidates = [
    \['init.vim', '~/.config/nvim/init.vim'],
    \['temp.md', '~/temp.md']]
call denite#custom#var('menu', 'menus', s:menus)


" Settings for Jedi-Vim
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#usages_command = "<leader>u"

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

" Ultisnips
let g:UltiSnipsUsePythonVersion = 3

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

" Set up webdev icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

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


" Confluence Wiki (Jira) syntax
au BufNewFile,BufRead *.jira set filetype=confluencewiki
