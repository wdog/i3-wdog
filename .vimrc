" VIMRC WDOG
"


" === PATHOGEN
" mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()
filetype plugin indent on
syntax on


" ===== NERDTREE 
map <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
"let NERDTreeWinPos='right'
"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ====== DISABLE VIM AIRLINE GIT STATUS 
let g:gitgutter_enabled = 0


" ------ GENERIC
set backspace=indent,eol,start
set ruler
set laststatus=2
set wildmenu


set sw=2
set ts=2
set st=2
set expandtab
set number
set nowrap
"let mapleader = ","
set encoding=utf-8 
set t_Co=256
set autoindent    " always set autoindenting on
set nocompatible 
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
" PARS 
set noshowmatch     " set show matching parenthesis on insert
let loaded_matchparen = 1

set noignorecase    " ignore case when searching
"set smartcase     " ignore case if search pattern is all lowercase,    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
"set so=7 " 7 linee when moving vertically
set magic " when using regexp

" -- PREVENT ACCIDENTAL U CAPS
nnoremap U :echo " < < ===== C H E C K -  C A P S  - L O C K ===== > > "<CR> 


" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" ====== SET EXTRA OPTIONS WHEN RUNNING IN GUI MODE
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" ==== AUTO GVIM IN X
"if &term=~"xterm"
"  gui
"endif

" ===== OPTION COLORS
colorscheme vorange

" ====== EDIT VIMRC 
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ===== HIDE BUFFERS (do not ask for save)
"set hidden

" ===== AIRLINE https://github.com/bling/vim-airline
"let g:airline_powerline_fonts = 1

" ===== LIGHTLINE https://github.com/itchyny/lightline.vim
"let g:lightline = { 'colorscheme': 'seoul256' }


"
"
" ====== MINIBUFFER MOVE

noremap <C-Left>   :MBEbp<CR>
noremap <C-Right> :MBEbn<CR>
noremap <C-Up> :MBEToggle<CR>
noremap <C-Down> :MBECloseAll<CR>


" ===== PHP DOCUMENTOR
"source ~/.vim/php-doc.vim
"inoremap <C-R> <ESC>:call PhpDocSingle()<CR>i
"noremap <C-R> :call PhpDocSingle()<CR>
"vnoremap <C-R> :call PhpDocRange()<CR> 
"let g:pdv_cfg_Author="Carlo Chech"

" ===== VISUAL MOUSE
set mouse=a

" ===== FOLDING AND UNFOLDING
let php_folding=0
nnoremap <space> za

" ===== OPEN NEW TAB [TABS]
nnoremap <C-y> <Esc>:tabnew<Cr>
nmap <C-L> gt
nmap <C-J> gT

" ====== HIDDEN CHARS
set listchars=tab:▸\ ,eol:¬,trail:·
nmap <silent> <leader>s :set nolist!<CR>



" ===== GV SELECT LAST VISUAL SELECTION
vnoremap > >gv
vnoremap < <gv


" ===== COLORS 
hi   TabLineFill   ctermfg=Black   ctermbg=DarkGreen
hi   TabLine       ctermfg=Black   ctermbg=DarkGrey
hi   TabLineSel    ctermfg=Red     ctermbg=Yellow   cterm=bold
hi   IncSearch     ctermfg=Yellow  ctermbg=Red      cterm=bold
hi   Pmenu         ctermbg=238 gui=bold

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


"hi MBENormal               ctermfg=Yellow ctermbg=Green  guifg=#808080 guibg=fg
"hi MBEChanged              ctermfg=Yellow guifg=#CD5907 guibg=fg
"hi MBEVisibleNormal        ctermfg=Yellow guifg=#5DC2D6 guibg=fg
"hi MBEVisibleChanged       ctermfg=Yellow guifg=#F1266F guibg=fg
"hi MBEVisibleActiveNormal  ctermfg=Yellow guifg=#A6DB29 guibg=fg
"hi MBEVisibleActiveChanged ctermfg=Yellow guifg=#F1266F guibg=fg

hi MBENormal               ctermfg=Gray 
hi MBEVisibleActiveNormal  ctermfg=Blue ctermbg=White

hi MBEVisibleActiveChanged ctermfg=Red ctermbg=White
hi MBEVisibleChanged       ctermfg=Yellow
hi MBEChanged              ctermfg=Red

" =====  RESTORE LAST POSITION 
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


" ===== MAP INDENT CODE
map <F7> mzgg=G`z<CR>

" ===== PRETTY XML FORMAT 
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
" ===================================
set t_Ff=^[<RAlt-Left>]

" ===== SYNTAX COLORS FIX  
noremap <F3> <Esc>:syntax sync fromstart<CR>
inoremap <F3> <C-o>:syntax sync fromstart<CR>
" ===== slow method 
"autocmd BufEnter * :syntax sync fromstart


" ===== TOGGLE PASTE OUTSIDE INSERT MODE 
map <Leader>v :set invpaste<CR>:set paste?<CR>

" ===== TOGGLE PASTE IN INSERT MODE 
set pastetoggle=<Leader>v

" ===== FORCE SAVING FILES THAT REQUIRE ROOT PERMISSION 
cmap w!! w !sudo tee > /dev/null %

" ===== ALIGN  BLOCK WITH : 
let @t='vi}\t:'


map <C-s> :w<CR>

" PERSISTENT UNDO
"set undofile                " Save undo's after file closes
"set undodir=$HOME/.vim/undo " where to save undo histories
"set undolevels=1000         " How many undos
"set undoreload=10000        " number of lines to save for undo



" ctrlp {
let g:ctrlp_working_path_mode = "ra"
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
      \ 'fallback': 'find %s/.. -type f'
      \ }
    let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$' }
"}



"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
setlocal cm=blowfish2

set textwidth=80
let g:vimtex_view_method = 'zathura'

nmap cc <plug>(vimtex-cmd-create)

let g:snipMate = {}
let g:snipMate.snippet_version = 1


autocmd FileType c,cpp,java,php,tex autocmd BufWritePre <buffer> %s/\s\+$//e
