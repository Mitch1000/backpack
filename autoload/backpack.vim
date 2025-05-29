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
"
" setup palette dictionary
let s:colors = {
      \ "dark0_hard": ['#1c1c1c', 234],
      \ "dark0_harder": ['#0E0E0E', 234],
      \ "dark0": ['#262626', 235],
      \ "dark0_soft": ['#303030', 236],
      \ "dark1": ['#3a3a3a', 237],
      \ "dark2": ['#4e4e4e', 239],
      \ "dark3": ['#606060', 241],
      \ "dark4": ['#767676', 243],
      \ "dark5": ['#444444', 238],
      \ "dark6": ['#606060', 241],
      \ "dark7": ['#1c1c1c', 234],
      \ "dark8": ['#303030', 236],
      \ "dark9": ['#262626', 235],
      \ "dark10": ['#1c1c1c', 234],
      \ "dark11": ['#121212', 233],
      \ "dark4_256": ['#767676', 243],
      \ "gray_246": ['#949494', 246],
      \ "gray_245": ['#8a8a8a', 245],
      \ "gray_244": ['#808080', 244],
      \ "light0_hard": ['#f7f0f7', 231],
      \ "light0": ['#eeeeee', 255],
      \ "light0_soft": ['#fae3fa', 254],
      \ "light1": ['#fcf7fc', 255],
      \ "light2": ['#f7f0f7', 254],
      \ "light3": ['#dadada', 253],
      \ "light4": ['#d0d0d0', 252],
      \ "light5": ['#b2b2b2', 249],
      \ "light6": ['#949494', 246],
      \ "light7": ['#dadada', 253],
      \ "light8": ['#c6c6c6', 251],
      \ "light9": ['#eeeeee', 255],
      \ "light10": ['#ffffff', 231],
      \ "light4_256": ['#eeeeee', 255],
      \ "stain_yellow": ['#d7af87', 180],
      \ "dark_gray": ['#262626', 235],
      \ "green": ['#87ffaf', 121],
      \ "dark_red": ['#af5f5f', 131],
      \ "error_red": ['#fc0404', 9],
      \ "bright_red": ['#d75f87', 168],
      \ "forest_blue": ['#5fafaf', 73],
      \ "bright_purple": ['#af87af', 139],
      \ "bright_neon_blue": ['#5fd7ff', 81],
      \ "baby_blue": ['#afffff', 159],
      \ "extra_light_blue": ['#d7ffff', 195],
      \ "rose": ['#ffd7d7', 224],
      \ "soft_pink": ['#f5ebf5', 225],
      \ "dark_stain_yellow": ['#af005f', 125],
      \ "dark_dark_gray": ['#1c1c1c', 234],
      \ "dark_green": ['#0087ff', 33],
      \ "terminal_green": ['#96ba92', 115],
      \ "terminal_blue": ['#bdcfe4', 153],
      \ "dark_dark_red": ['#af5f5f', 131],
      \ "dark_bright_red": ['#d75f87', 168],
      \ "dark_forest_blue": ['#d70087', 162],
      \ "dark_bright_purple": ['#5f00af', 55],
      \ "dark_bright_neon_blue": ['#0087ff', 33],
      \ "dark_baby_blue": ['#d787ff', 177],
      \ "dark_extra_light_blue": ['#444444', 238],
      \ "dark_rose": ['#ff87d7', 212],
      \ }

function! backpack#GetColors()
  return s:colors
endfunction 

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
