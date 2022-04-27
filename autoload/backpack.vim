" -----------------------------------------------------------------------------
" File: backpack.vim
" Description: Retro color scheme for Vim
" Author: mitch1000 <mitt.brohan@yahoo.ca>
" Source: https://github.com/mitch1000/backpack
" Last Modified: 26 April 2022
" -----------------------------------------------------------------------------

function! backpack#invert_signs_toggle()
  if g:backpack_invert_signs == 0
    let g:backpack_invert_signs=1
  else
    let g:backpack_invert_signs=0
  endif

  colorscheme backpack
endfunction

" Search Highlighting {{{

function! backpack#hls_show()
  set hlsearch
  call BackpackHlsShowCursor()
endfunction

function! backpack#hls_hide()
  set nohlsearch
  call BackpackHlsHideCursor()
endfunction

function! backpack#hls_toggle()
  if &hlsearch
    call backpack#hls_hide()
  else
    call backpack#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
