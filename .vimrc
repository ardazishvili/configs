execute pathogen#infect()
syntax on
filetype plugin indent on    " required

set cindent
set cino=g0,>2,h2 " g0-public, >-'normal', h2-class methods
set rnu
:nnoremap zff zf/^$<CR>
:nnoremap <F8> :TagbarToggle<CR>
:filetype plugin on
:set splitright
:set splitbelow
set tags=./tags,tags;$HOME

if ! has("gui_running")
    set t_Co=256
endif
" feel free to choose :set background=light for a different style
set background=dark
colors peaksea

"" NERDTree settings
:nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
autocmd VimEnter * NERDTree

"" syntactic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" gitgutter settings
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
highlight GitGutterAdd    ctermfg=46 
highlight GitGutterChange ctermfg=226
highlight GitGutterDelete ctermfg=9 
highlight GitGutterAddLine     ctermfg=46
highlight GitGutterChangeLine  ctermfg=226 
highlight GitGutterDeleteLine  ctermfg=9 
set updatetime=100
:nnoremap <c-p> :GitGutterPreviewHunk<cr>

""ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
let g:UltiSnipsSnippetDirectories = ['my-snippets']

"" youcompleteme settings
let g:ycm_confirm_extra_conf = 0


""global settings
set exrc
set secure
