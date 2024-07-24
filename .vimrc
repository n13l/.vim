filetype on                                                                     
filetype plugin on                                                              
filetype indent on                                                              
syntax on                                                                       
set fileencodings=utf-8

set number                                                                      
set nocompatible
set statusline+=%o
set ruler                                                                       
set showmode                                                                    
set backspace=2                                                                 
set nobackup                                                                    
set nowb                                                                        
set noswapfile
set ignorecase
set binary
set noeol


set fillchars+=vert:\ 
let NERDTreeShowHidden=1
set t_Co=256
let mapleader = "\\"

hi WinSeparator term=bold ctermfg=grey guifg=grey gui=bold guifg=grey

source ~/.claude_api_key

if &term=~'screen-256color' 
	colo ron
	hi LineNr term=bold ctermfg=grey guifg=grey gui=bold guifg=grey
endif

if &term=~'xterm' 
	colo ron
	hi LineNr term=bold ctermfg=grey guifg=grey gui=bold guifg=grey
endif

if &term=~'xterm-256color' 
	colo ron
	hi LineNr term=bold ctermfg=grey guifg=grey gui=bold guifg=grey
endif


if has("unix")                                                                  
	let s:uname = system("uname")                                           
	if s:uname == "Linux\n"
		colo ron
	endif                                                                   
endif

hi LineNr term=bold ctermfg=grey guifg=grey gui=bold guifg=grey

noremap <F8> :set list!<CR>
map <C-c> "+y<CR>

hi NonText guifg=#4a4a59
hi SpecialKey guifg=#4a4a59
hi Search ctermfg=white ctermbg=black cterm=bold

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set backspace=indent,eol,start
set cc=80

hi OverLength ctermbg=black ctermfg=white guibg=black
match OverLength /\%>80v.\+/
set smartcase
set hlsearch "Highlight search things

hi PMenu ctermbg=black ctermfg=white
hi PMenuSel ctermbg=white ctermfg=black

let g:snips_author = 'Daniel Kubec'
let g:snips_email = 'niel@rtfm.cz'
let g:snips_copyright = 'Example Corp.'

" Complete options (disable preview scratch window)
"set completeopt=menu,menuone,longest

set conceallevel=2
set concealcursor=vin
"let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
"let g:CCTreeKeyTraceForwardTree = '<C-\>>' 
"let g:CCTreeKeyTraceReverseTree = '<C-\><' 
"let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
"let g:CCTreeKeySaveWindow = '<C-\>y' 
"let g:CCTreeKeyToggleWindow = '<C-\>w' 
"let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree 
"let g:CCTreeKeyDepthPlus = '<C-\>=' 
"let g:CCTreeKeyDepthMinus = '<C-\>-'

set foldcolumn=0
hi FoldColumn ctermbg=NONE ctermfg=NONE
hi ColorColumn ctermbg=DarkGray  guibg=DarkGray
hi StatusLine guifg=#e4e4e4 guibg=#606060 gui=NONE ctermfg=254 ctermbg=241 cterm=NONE
hi StatusLineNC guifg=#585858 guibg=#303030 gui=NONE ctermfg=240 ctermbg=236 cterm=NONE
hi Folded guifg=#ffffff guibg=#444444 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE

hi NERDTreeCWD guifg=#0000ff ctermfg=238

let winManagerWindowLayout = 'FileExplorer|TagList'
let Tlist_WinWidth=40
let Tlist_Enable_Fold_Column=0

nnoremap <F2> :TlistOpen<CR>
nnoremap <F3> :TlistToggle<CR>
nnoremap <F4> :NERDTreeToggle<CR> 
nnoremap <F5> :CCTreeLoadDB<CR>
" nnoremap <F6> :call g:ClangUpdateQuickFix()<CR>
nmap <C-g><C-o> <Plug>window:quickfix:toggle
let NERDTreeMinimalUI=1
nnoremap <C-F10> :%!xxd -p<CR>
nnoremap <C-F11> :%!xxd -p -r<CR>

" Quit Vim
nnoremap <Leader>q :q<CR>

au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd', '--background-index', '--header-insertion=never']},
    \ 'allowlist': ['c', 'cpp', 'objc'],
    \ 'initialization_options': {},
    \ })

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal completeopt-=preview
    setlocal keywordprg=:LspHover

    nmap <buffer> <C-]> <plug>(lsp-definition)
    nmap <buffer> <C-W>] <plug>(lsp-peek-definition)
    nmap <buffer> <C-W><C-]> <plug>(lsp-peek-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> <C-n> <plug>(lsp-next-reference)
    nmap <buffer> <C-p> <plug>(lsp-previous-reference)
    nmap <buffer> gI <plug>(lsp-implementation)
    nmap <buffer> go <plug>(lsp-document-symbol)
    nmap <buffer> gS <plug>(lsp-workspace-symbol)
    nmap <buffer> ga <plug>(lsp-code-action)
    nmap <buffer> gR <plug>(lsp-rename)
    nmap <buffer> gm <plug>(lsp-signature-help)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
