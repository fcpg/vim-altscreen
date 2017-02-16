" altscreen.vim - alternate screen setup for terminal Vim
if exists("g:loaded_altscreen") || &cp
  finish
endif
let g:loaded_altscreen = 1


"----------------
" Functions {{{1
"----------------

function! UnsetAltScreen()
  let g:altscreen_save_t_ti = &t_ti
  let g:altscreen_save_t_te = &t_te
  let &t_ti = ''
  let &t_te = ''
endfun

function! SetAltScreen()
  let &t_ti = g:altscreen_save_t_ti
  let &t_te = g:altscreen_save_t_te
endfun

function! AltScreenControlZ()
  try
    call SetAltScreen()
    suspend!
  finally
    call UnsetAltScreen()
  endtry
endfun


"-----------
" Init {{{1
"-----------

" Autocmds {{{2
augroup myNoAltScreen
  au!
  autocmd VimEnter *  call UnsetAltScreen()
  autocmd VimLeave *  call SetAltScreen()
augroup END


" Maps {{{2
silent! noremap <unique> <silent>  <C-z>  :<C-u>call AltScreenControlZ()<cr>


" vim: et sw=2:
