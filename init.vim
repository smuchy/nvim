syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undofile
set laststatus=2
set statusline+=%F
set incsearch
set backspace=indent,eol,start
set scrolloff=10

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
"Plug 'jremmen/vim-ripgrep'
"Plug 'vim-utils/vim-man'
"Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'vim-syntastic/syntastic'
"Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
"Plug 'puremourning/vimspector'
"Plug 'szw/vim-maximizer'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install()} }
"Plug 'junegunn/fzf.vim'
"Plug 'mattn/emmet-vim'
"Plug 'tweekmonster/django-plus.vim'
"Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
"Plug 'simrat39/rust-tools.nvim'

call plug#end()

" Require plugin configs
lua require('smuchy')
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

colorscheme gruvbox
set background=dark

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

if executable('rg')
    let g:rg_derive_root='true'
endif
set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode

let python_highlight_all = 1
let g:python_highlight_func_calls = 1
" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css EmmetInstall
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'html' : {
\    'indent_blockelement': 1,
\  },
\}


au BufNewFile,BufRead *.html set filetype=htmldjango

" FZF
let g:fzf_layout = { 'window': { 'width': 3.8, 'height': 3.8} }


let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:newtrw_winsize = 25
let NERDTreeShowHidden = 1

let g:ctrlp_use_caching = 0

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>
nnoremap <silent> <Leader>3 :vertical resize 30<CR>
nnoremap <silent> <Leader>5 :vertical resize 50<CR>

"Vimspector
"nnoremap <leader>m :MaximizerToggle!<CR>
"nnoremap <leader>dd :call vimspector#Launch()<CR>
"nnoremap <leader>de :call vimspector#Reset()<CR>
"nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
"
"nmap <leader>dl <Plug>VimspectorStepInto
"nmap <leader>dj <Plug>VimspectorStepOver
"nmap <leader>dk <Plug>VimspectorStepOut
"nmap <leader>d_ <Plug>VimspectorStepRestart
"nnoremap <leader>dc :call vimspector#Continue()<CR>
"
"nmap <leader>dlc <Plug>VimspectorRunToCursor
"nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
"nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
"
nnoremap <leader>pv :NERDTreeFind<CR>
nnoremap <leader>e :e#<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"OmniPopup

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'tab'
            return "\<C-N>"
       " elseif a:action == 'k'
       "     return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><Tab> <C-R>=OmniPopup('tab')<CR>
nnoremap <Leader><space> :noh<cr>
