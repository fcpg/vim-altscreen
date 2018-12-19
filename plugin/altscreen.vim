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
  if get(g:, 'altscreen_reset', 1)
    let &t_ti = ""
    let &t_te = ""
  else
    let &t_ti = substitute(&t_ti, '\e\[?1049[hl]', '', '')
    let &t_te = substitute(&t_te, '\e\[?1049[hl]', '', '')
  endif
endfun

function! SetAltScreen()
  let &t_ti = g:altscreen_save_t_ti
  let &t_te = g:altscreen_save_t_te
endfun

function! AltScreenControlZ()
  try
    call SetAltScreen()
    if exists('#AltScreen#User#suspend')
      doauto <nomodeline> AltScreen User suspend
    endif
    suspend!
  finally
    if exists('#AltScreen#User#resume')
      doauto <nomodeline> AltScreen User resume
    endif
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
