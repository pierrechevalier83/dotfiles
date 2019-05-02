" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" remember to perform `:PlugInstall` and `:UpdateRemotePlugins`
call plug#begin('~/.local/share/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'severin-lemaignan/vim-minimap'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
call plug#end()

" general settings
syntax on
set hidden
set number
set mouse=a
set autoread
au CursorHold * checktime
set tabstop=4
set shiftwidth=4
set ai
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set laststatus=2
set clipboard=unnamedplus
set nocompatible
filetype plugin on

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme="base16_google"

" rust
let g:rustfmt_autosave = 1
let g:rust_cargo_check_all_targets = 1

" lsp
let g:LanguageClient_serverCommands = {
    \ 'rust': ['/bin/rustup', 'run', 'stable', 'rls']}

" auto completion
let g:deoplete#enable_at_startup = 1

" nerdtree
" start nerdree automatically when opening a folder rather than a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close neovim if only nerdtree is still open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" shortcuts
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <silent> <Leader>b :Cbuild <CR>
nnoremap <silent> <Leader>t :Ctest <CR>
nnoremap <silent> <Leader>r :Crun <CR>
nnoremap <silent> <Leader>p :FZF <CR>
nnoremap <silent> <C-p> :FZF <CR>
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>k :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <Leader>gd :call LanguageClient#textDocument_definition()<CR>
