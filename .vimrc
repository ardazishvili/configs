execute pathogen#infect()
syntax on
filetype plugin indent on    " required

set cindent
set cino=g0,>2,h2 " g0-public, >-'normal', h2-class methods
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
nnoremap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
autocmd VimEnter * NERDTree

"" gitgutter settings
highlight GitGutterAdd    ctermfg=46
highlight GitGutterChange ctermfg=226
highlight GitGutterDelete ctermfg=9
highlight GitGutterAddLine     ctermfg=46
highlight GitGutterChangeLine  ctermfg=226
highlight GitGutterDeleteLine  ctermfg=9
highlight clear SignColumn
" set updatetime=100
nnoremap ,p :GitGutterPreviewHunk<cr>
nnoremap ,q :GitGutterUndoHunk<cr>
nnoremap ,z :GitGutterStageHunk<cr>
let g:gitgutter_use_location_list = 1

"" vim-fugitive settings
nmap gs :G<CR>
nmap ff :Gdiff<CR>
nmap ga :diffget //2<CR>
nmap gl :diffget //3<CR>
set diffopt+=vertical
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

""ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
let g:UltiSnipsSnippetDirectories = ['my-snippets']

"" youcompleteme settings
set completeopt-=preview
nnoremap <c-\> :YcmCompleter GoToDeclaration<CR>
nnoremap <c-]> :YcmCompleter GoToDefinition<CR>
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = exepath("clangd")

"" vim-clang-format settings
let g:clang_format#auto_format = 1
let g:clang_format#detect_style_file = 1

""global settings
set exrc
set secure
set hlsearch
set encoding=UTF-8
let mapleader=","
set mouse=a

""ALE settings
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

""vim-autoformat settings
" au BufWrite * :Autoformat
let g:formatdef_my_custom_haskell = '"brittany --write-mode=inplace"'
let g:formatters_haskell = ['my_custom_haskell']

""cpp-enhanced-highlight settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

""Vimspector settings
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

nnoremap tt :vertical terminal<cr>
" nnoremap ,. :! cd cbuild && make && ./editor<cr>
" nnoremap ,. :! g++ test.cpp -g -o test && ./test <cr>
" nnoremap ,. :! cargo run <cr>
nnoremap ,. :! python3 % <cr>
nnoremap <Leader>, :wa<CR>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap ;; A;<ESC>
