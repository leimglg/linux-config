let mapleader = " "
set mouse=a
inoremap jj <Esc>
set number
syntax on
set cursorline    
set wrap         
set showcmd    
set wildmenu  
set nohlsearch
set smartcase 
set nocompatible
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set updatetime=0
set shortmess+=c
set showmatch
runtime macros/matchit.vim

filetype on
filetype plugin on
filetype plugin indent on
let &t_ut=' '
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set tw=0
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  
noremap j h
noremap k j
noremap i k
noremap I 5kzz
noremap K 5jzz
noremap h i
noremap H I
noremap J b
noremap L w
noremap gi gg
noremap gk G
noremap gj 0
noremap gl $
noremap <Space><Space> f<Space>

noremap <C-u> <C-u>zz
noremap <C-k> <C-d>zz
noremap <C-j> B
noremap <C-l> W
inoremap <C-u> <up>
inoremap <C-k> <down>
inoremap <C-j> <left>
inoremap <C-l> <right>


noremap - <C-x>
noremap = <C-a>
 
noremap s <nop>
noremap S :w<CR>
noremap Q :q<CR>
noremap R :source $MYVIMRC<CR>

noremap sL :set splitright<CR>:vsplit<CR>
noremap sJ :set nosplitright<CR>:vsplit<CR>
noremap sI :set nosplitbelow<CR>:split<CR>
noremap sK :set splitbelow<CR>:split<CR>
noremap s<C-l> <C-w>L
noremap s<C-j> <C-w>J
noremap s<C-u> <C-w>I
noremap s<C-k> <C-w>K
noremap si <C-w>k
noremap sj <C-w>h
noremap sk <C-w>j
noremap sl <C-w>l
noremap sV <C-w>H
noremap sH <C-w>K
noremap s<up> :res +5<CR>
noremap s<down> :res -5<CR>
noremap s<left> :vertical resize -5<CR>
noremap s<right> :vertical resize +5<CR>

noremap tc :tabe<CR>
noremap tj :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tJ :-tabmove<CR>
noremap tL :+tabmove<CR>

noremap <LEADER>/ :set splitright<CR>:vsplit<CR>:vertical res -20<CR>:term<CR>i
tnoremap jj <C-\><C-n>
noremap <LEADER>, %


" noremap ,f <ESC>/<++><CR>:nohlsearch<CR>c4l
inoremap ,f <ESC>/<++><CR>:nohlsearch<CR>c4l
inoremap ,, <++>
inoremap ,n ---<Enter><Enter>
inoremap ,b **** <++><Esc>F*hi
inoremap ,s ~~~~ <++><Esc>F~hi
inoremap ,i ** <++><Esc>F*i
inoremap ,d `` <++><Esc>F`i
inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++>4kA
inoremap ,h ==== <++><Esc>F=hi
inoremap ,p ![](<++>) <++><Esc>F[a
inoremap ,a [](<++>) <++><Esc>F[a
inoremap ,l --------<Enter>

noremap <LEADER>sc :set spell!<CR>
noremap <LEADER>rf :r !figlet 
noremap \s :%s//g<left><left>
noremap <LEADER>sw :set wrap<CR>

call plug#begin('~/.vim/plugged')
" file navigation, tt to show
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
" Taglist, show function list
Plug 'majutsushi/tagbar', {'on': 'TagbarOpenAutoClose'}
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Error checking
" Plug 'W0rp/ale'
" markdown preview
" Plug 'iamcco/markdown'
" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

"           NERDTree
nnoremap tt :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'h'
let g:NERDTreeMapPreviewSplit = 'gh'
let g:NERDTreeMapCustomOpen = 'l'
let g:NERDTreeMapCloseDir = 'j'
let g:NERDTreeCustomOpenArgs = {'file':{'where': 'v', 'reuse': 'all', 'keepopen': 1}}

let g:mkdp_path_to_chrome = "termux-open"

"         vim-table-mode
map <LEADER>tm :TableModeToggle<CR>

"         coc
let g:coc_global_extensions = ['coc-json', 'coc-julia', 'coc-tsserver']

nnoremap <F5> :call CompileRun()<CR>
func! CompileRun()
	if &filetype == 'julia'
		exec "!julia %"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
	endif
endfunc

