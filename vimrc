set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""
" Syntastic Settings "
""""""""""""""""""""""
let g:syntastic_python_checkers = ['pep8', 'pylint', 'flake8']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_coffeescript_checkers = ['coffeelint']
let g:syntastic_json_checkers = ['jsonlint']
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:syntastic_python_pep8_args="--ignore=E731,F821,W503"
let g:syntastic_python_flake8_args="--ignore=E731,F821,W503"
let g:syntastic_python_pylint_args="--disable=too-many-lines,ungrouped-imports,too-few-public-methods,import-error,attribute-defined-outside-init,invalid-name,missing-docstring,wrong-import-order,too-many-locals,line-too-long,--enable=undefined-variable,unused-variable,unused-import"
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

"""""""""""""""""""""""""""y"
" Plugins (Vundle Managed) "
""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'  " Git integration
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'craigemery/vim-autotag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-expand-region'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/gitignore'
Plugin 'vimwiki/vimwiki'
Plugin 'Yggdroot/indentLine'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""
" TOGGLE OPTIONS "
""""""""""""""""""
" Display altering toggle options
nnoremap <silent> <F1> :set hlsearch! \| set hlsearch?<CR>
imap <silent> <F1> <C-O><F1>
nnoremap <silent> <F2> :set wrap! \| set wrap?<CR>
imap <silent> <F2> <C-O><F2>
nnoremap <silent> <F3> :if &list == 0 \| set list \| execute 'IndentLinesEnable' \| else \| set nolist \| execute 'IndentLinesDisable' \| endif<CR>
imap <silent> <F3> <C-O><F3>
nnoremap <silent> <F4> :set relativenumber! \| set relativenumber?<CR>
imap <silent> <F4> <C-O><F4>
nnoremap <silent> <F5> :set cursorline! \| set cursorline?<CR>:set cursorcolumn! \| set cursorcolumn?<CR>
imap <silent> <F5> <C-O><F5>

" Behavior-altering option toggles
nnoremap <silent> <F9> :set scrollbind! \| set scrollbind?<CR>
imap <silent> <F9> <C-O><F9>
nnoremap <silent> <F10> :set spell! \| set spell?<CR>
imap <silent> <F10> <C-O><F10>
nnoremap <silent> <F11> :set ignorecase! \| set ignorecase?<CR>
imap <silent> <F11> <C-O><F11>
nnoremap <silent> <F12> :set paste! \| set paste?<CR>
imap <silent> <F12> <C-O><F12>

" toggle option defaults and settings
set spell
set pastetoggle=<F12>
set listchars=eol:¬,tab:▶\ ,trail:·,extends:>,precedes:<,nbsp:%,space:\ ,conceal:*
set cursorline
set cursorcolumn
set relativenumber
set number
set nowrap

" don't need relative numbers when not in focus
autocmd FocusLost * set norelativenumber
autocmd FocusGained * set relativenumber

" don't need relative lines during insert mode
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

""""""""""""""""""""
" General Settings "
""""""""""""""""""""
let mapleader=" "
syntax on
set timeoutlen=3000 ttimeoutlen=100

" closetag.vim. <C-_> auto closes html/xml tags
autocmd FileType html,xml,xsl source ~/.vim/scripts/closetag.vim

" I save my tags file (As generated by exuberant ctags) here in the .git
" folder
set tags=.git/tags

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" allow copy/paste to interact with system clipboard
set clipboard=unnamed

set scrolloff=1
set sidescrolloff=0

set autoread

" persistent undo!
" Assumes Unix system.
set undofile
set undodir=$HOME/.vim/undo
if empty(&undodir)
    call mkdir(&undodir, "p")
endif

set wildmenu                            " get wild
set wildmode=longest:full               " prefix matching for wildmenu
set completeopt+=longest                " insert up to the matched prefix
" unlikely to want to match these
set wildignore+=*.class,*.o,*.pyc,*.git,*/venv/*,*.swp,*/vendor/*

set backspace=2 " make backspace work like most other editors

set hidden
set autowriteall
set switchbuf=usetab

" Close location list or quickfix when selecting file
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>:lclose<CR>


""""""""""""""""""""
" SuperTab Settings "
"""""""""""""""""""""
let g:SuperTabCrMapping = 1

""""""""""""""""""""
" Airline Settings "
""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
" Update the buffer tabline if a buffer not in the current window is deleted
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
set laststatus=2
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 0
let g:airline_skip_empty_sections = 1
let g:airline_theme='zenburn'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"""""""""""""""""""""""
" indentLine Settings "
"""""""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 235
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0   "don't use indentLine by default

"""""""""""""""""""""""
" EasyMotion Settings "
"""""""""""""""""""""""
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

""""""""""""""""""""""
" UltiSnips Settings "
""""""""""""""""""""""
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<C-N>"
let g:UltiSnipsJumpBackwardTrigger="<C-P>"
let g:ultisnips_python_style="google"

"""""""""""""""""""""
" NERDTree Settings "
"""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$', '\.o$', 'website/vendor[[dir]]', 'venv[[dir]]', '__pycache__[[dir]]', '\.egg-info[[dir]]']
let NERDTreeQuitOnOpen=1    " Closes NERDTree window after file open
" auto close vim if NERDTree is last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""
" Theme Settings "
""""""""""""""""""
syntax enable     " Use syntax highlighting
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

"""""""""""""""""""
" Ctrl-P Settings "
"""""""""""""""""""
let g:ctrlp_mruf_relative = 1
let g:ctrlp_working_path_mode = "ar"
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""
" Custom Key Mappings "
"""""""""""""""""""""""
" Full screen vim window
nnoremap <C-W>+ <C-W>\|<C-W>_

" Duplicates line
nnoremap <leader>p Yp
vnoremap <leader>p y`]p

" Quickfix Shortcuts
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cq :cclose<CR>
nnoremap <silent> <leader>cf :cfirst<CR>
nnoremap <silent> <leader>cl :clast<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprevious<CR>

" Location List shortcuts
nnoremap <silent> <leader>vo :lopen<CR>
nnoremap <silent> <leader>vq :lclose<CR>
nnoremap <silent> <leader>vf :lfirst<CR>
nnoremap <silent> <leader>vl :llast<CR>
nnoremap <silent> <leader>vn :lnext<CR>
nnoremap <silent> <leader>vp :lprevious<CR>

" Marks
nnoremap <leader>m :marks 'qwertyuiopasdfghjklzxcvbnm0123456789\"[]^.<CR>:normal `
nnoremap <leader>M :marks QWERTYUIOPASDFGHJKLZXCVBNM<CR>:normal `

" Easier movement to beginning/end of line
noremap - $
vnoremap - $h
noremap 0 ^
noremap _ 0

" Insert a single character
function! RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal! i".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Move lines easily
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Insert lines above and below cursor
nnoremap <leader>o mqo<ESC>`qj
nnoremap <leader>O mqO<ESC>`q

" Save easily
nnoremap <C-S> :w<CR>
vnoremap <C-S> <ESC>:w<CR>
inoremap <C-S> <ESC>:w<CR>

" Exit insert mode
inoremap jk <ESC>

"" BUFFER/WINDOW MADNESS
" List and switch buffers CtrlP-style
nnoremap <leader>bb :CtrlPBuffer<CR>
" Close current buffer and open next
function! BufferDelete()
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1
        execute "bp|bd#"
    else
        execute "enew|bd#"
    endif
endfunction
nnoremap <leader>bq :call BufferDelete()<CR>
" Go to next/previous buffer
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
" Switch to last used buffer
nnoremap <leader>bl :e#<CR>
" Clear all but current buffer
nnoremap <leader>bc :%bd<CR><C-O>:bd#<CR>

" Easy quit
nnoremap <leader>q :q<CR>
vnoremap <leader>q <ESC>:q<CR>

" arrow keys for scrolling
noremap <Down> 5<C-E>
noremap <Up> 5<C-Y>
noremap <Left> 10zh
noremap <Right> 10zl

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Stop that stupid window from popping up
map q: :q

" macro for the ubiquitous 'n.'
let @n = "n."

" System call, but chomp off newline
function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

function! GitHubURL(regname) range
    let path = expand('%')
    let branch = ChompedSystem("git rev-parse --abbrev-ref HEAD")
    let remote_url = ChompedSystem("git config --get remote.origin.url")
    " extract domain and repo from both ssh and https style remote urls
    let domain = substitute(remote_url, '\(git@\|https://\)\([a-z.]*\)\(:\|/\).*', '\2', '')
    let repo = substitute(remote_url, '.*'.domain.'\(:\|/\)\([a-zA-Z0-9/]*\)\(\.git\)\?', '\2', '')
    let github_url = "https://".domain."/".repo."/blob/".branch."/".path."#L".a:firstline."-L".a:lastline
    call setreg(a:regname, github_url."\n")
    echom github_url
endfunction
" Copy GitHubURL to register and echo at bottom of screen
nnoremap <silent> <leader>ig :call GitHubURL(v:register)<CR>
vnoremap <silent> <leader>ig :call GitHubURL(v:register)<CR>

" Change bar's default behavior to go to text width column
function! BarWithDefault(count)
    if a:count > 1
        execute "normal! ".a:count."|"
    elseif &tw
        execute "normal! ".&tw."|"
    else
        execute "|"
    endif
endfunction
nnoremap <silent> <bar> :<C-U>call BarWithDefault(v:count1)<CR>
"""""""""""""""""""""""""
" Vim-Surround Mappings "
"""""""""""""""""""""""""
nmap S ysiw

""""""""""""""""""""""
" Syntastic Mappings "
""""""""""""""""""""""

nnoremap <leader>sc :SyntasticCheck<CR>:Errors<CR>:lopen<CR>

"""""""""""""""""""
" Tagbar Mappings "
"""""""""""""""""""

nnoremap <leader>tb :TagbarOpenAutoClose<CR>

"""""""""""""""""""""""
" EasyMotion Mappings "
"""""""""""""""""""""""

" EasyMotion regex searching
map  // <Plug>(easymotion-sn)
omap // <Plug>(easymotion-tn)

" Easy Line motions
map gj <Plug>(easymotion-j)
map gk <Plug>(easymotion-k)
map gl <Plug>(easymotion-sol-bd-jk)

" <leader>f {char} to move to {char}
map <leader>f <Plug>(easymotion-bd-f)

""""""""""""""""""""""""""""""
" IncrementalSearch Mappings "
""""""""""""""""""""""""""""""
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)

""""""""""""""""""""""""""
" Expand Region Mapptings "
""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"""""""""""""""""""""
" NERDTree Mappings "
"""""""""""""""""""""
nnoremap <leader>tt :NERDTree<CR>
nnoremap <leader>tf :NERDTreeFind<CR>zz

"""""""""""""""""""
" Ctrl-P Mappings "
"""""""""""""""""""
" ctrl-p ctags integration
nnoremap <leader>. :CtrlPTag<CR>
