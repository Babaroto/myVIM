"SET BASICS SETUP FOR GUI
syntax on

"DISABLE ALL FLASH AND BEEP SOUNDS OF THE SCREEN
set belloff=all
"IDENTATION CONFIG
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"LINE NUMBERS
set rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch "INCREMENTAL SEARCH

"SET STYLE FOR PYTHON CODES
set fileformat=unix
set encoding=utf8

"SET COLOR LINE ON THE EDGE
highlight ColorColumn ctermbg=1 guibg=lightgrey

"PLUGIN INSTANCE
call plug#begin('~/.vim/plugged')

"COLOR SCHEMES
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'sainnhe/forest-night'

"AIRLINE THEMES
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"LET GIT COMMANDS TO RUN ON VIM
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"PLUG THAT WORKS TO GET A TREE OF THE DIR 
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/nerd-fonts' "PLUG THAT CHANGES THE FONT OF THE TERMINAL (NEEDED FOR DEVICONS)
Plug 'ryanoasis/vim-devicons' "GIVE ICONS FOR ALL THE EXTENSIONS 

"PLUG THAT WORKS TO FILL HTML AND CSS SCRIPTS
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color' "APPLY COLOR ON CSS FILE TO MAKE SURE WHAT COLOR ARE USING

"PLUG THAT SUPOSE TO MAKE A WEB SEARCH FOR A SELECTED ITEM
Plug 'voldikss/vim-browser-search'

"AUTOIDENTATION Y SINTAXIS PYTHON
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'

"AUTOCOMPLETE
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"DESIGN OF GRUVBOX
colorscheme gruvbox
set background=dark

if executable('rg')
  let g:rg_derive_root='true'
endif

"WEB SEARCH CONFIGURATION
nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual

"NERDTREE MAPP KEY
map <Leader>m :NERDTreeToggle<CR> 

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('txt', 'lightgray', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'white', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'white', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('cpp', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"UNDOTREE
noremap <Leader>u :UndotreeShow<CR>

"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol="X"
let g:syntastic_style_error_symbol="X"
let g:syntastic_warning_symbol="$" 
let g:syntastic_style_warning_symbol="$"

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

"COLORSCHEME
if has('termguicolors')
   set termguicolors
endif

let g:forest_night_enable_italic=1
let g:forest_night_disable_italic_comment=1

colorscheme forest-night

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

"MAP Coc

let g:coc_node_path = 'C:/Program Files/nodejs/node.exe'

"GOTO NAVEGATION
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references) 
noremap <leader> gs :CocSearch

"REMAP
noremap <leader>w :w<cr>
noremap <leader>x :x<cr>
noremap <leader>fs :Files<cr>
noremap <leader>h :help
noremap <leader>q :q<cr>

"NERD FONTS
let g:airline_powerline_fonts = 1
