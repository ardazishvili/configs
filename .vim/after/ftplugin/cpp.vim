"" ALE settings
let g:ale_linters = {'cpp': ['clang']}

:nnoremap ,l :!cmake -Bbuild -H. && make -C build<cr>
:nnoremap // :!clang-format -i % <cr><cr>
:nnoremap ,a :A<cr>
