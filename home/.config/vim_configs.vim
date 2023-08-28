"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:despacio_Midnight = 1
colorscheme despacio

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check Python files with pylint.
let g:ale_linters = {'python': ['pylint','bandit']}
" Fix Python files with black
let g:ale_fixers = {'python': ['black']}

let g:ale_fix_on_save = 1
let g:ale_python_bandit_options = '--severity-level=all --configfile=pyproject.toml'
let g:ale_python_pylint_options = '--disable=all --enable=E,C,W --disable=C0330 --disable=C0114,C0115,C0116'
