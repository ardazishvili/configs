execute pathogen#infect()
syntax on
filetype plugin indent on    " required

" set cindent
" set cino=g0,>2,h2 " g0-public, >-'normal', h2-class methods
:set tabstop=2
:set shiftwidth=2
:set expandtab
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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1

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
" nnoremap ,z :GitGutterPreviewHunk<cr>
nnoremap ,z :GitGutterStageHunk<cr>
nnoremap ,q :GitGutterUndoHunk<cr>

""ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
let g:UltiSnipsSnippetDirectories = ['my-snippets']

"" youcompleteme settings
let g:ycm_use_clangd=0
set completeopt-=preview
nnoremap <c-\> :YcmCompleter GoToDeclaration<CR>
nnoremap <c-]> :YcmCompleter GoToDefinition<CR>

"" vim-clang-format settings
let g:clang_format#auto_format = 1
let g:clang_format#detect_style_file = 1

""global settings
set exrc
set secure
set hlsearch

""ALE settings
let g:ale_virtualenv_dir_names = []
" let g:ale_linters = { 'python': ['mypy'] }
let g:ale_linters = { 'python': ['pylint', 'mypy'] }
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

""vim-autoformat settings
au BufWrite * :Autoformat
let g:formatdef_my_custom_haskell = '"brittany --write-mode=inplace"'
let g:formatters_haskell = ['my_custom_haskell']

nnoremap tt :vertical terminal<cr>
" nnoremap ,. :! cd cbuild && make && ./colony<cr>
" nnoremap ,. :! cd cbuild && make && ./cpp_option<cr>
nnoremap ,. :! ghc baby.hs -o test && ./test <cr>
" nnoremap ,. :! clear && cargo run<cr>
" nnoremap .. :! cargo build<cr>
" nnoremap ., :! cd cbuild && make && ./unit_tests<cr>
" nnoremap // :! cd cbuild && make clean<CR>
nnoremap ,, :wa<CR>
" nnoremap pp :! python3 main.py<cr>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap ;; A;<ESC>
