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
      \ "dark0_hard": ['#1b1b1b', 234],
      \ "dark0_harder": ['#0e0e0e', 234],
      \ "dark0": ['#222222', 235],
      \ "dark0_soft": ['#303030', 236],
      \ "dark1": ['#3a3a3a', 237],
      \ "dark2": ['#4d4d4d', 239],
      \ "dark3": ['#5f5f5f', 241],
      \ "dark4": ['#757575', 243],
      \ "dark5": ['#444444', 238],
      \ "dark6": ['#5f5f5f', 241],
      \ "dark7": ['#1b1b1b', 234],
      \ "dark8": ['#303030', 236],
      \ "dark9": ['#212121', 235],
      \ "dark10": ['#1b1b1b', 234],
      \ "dark11": ['#121212', 233],
      \ "dark4_256": ['#757575', 243], 
      \ "gray_246": ['#949494', 246],
      \ "gray_245": ['#8a8a8a', 245],
      \ "gray_244": ['#808080', 244],
      \ "light0_hard": ['#f8eff7', 231],
      \ "light0": ['#eeeeee', 255],
      \ "light0_soft": ['#fee1fb', 254],
      \ "light1": ['#f7f0f6', 255],
      \ "light2": ['#f8eff7', 254],
      \ "light3": ['#dadada', 253],
      \ "light4": ['#d0d0d0', 252],
      \ "light5": ['#b2b2b2', 249],
      \ "light6": ['#949494', 246],
      \ "light7": ['#dadada', 253],
      \ "light8": ['#c6c6c6', 251],
      \ "light9": ['#eeeeee', 255],
      \ "light10": ['#ffffff', 231],
      \ "light4_256": ['#eeeeee', 255],
      \ "stain_yellow": ['#d6a477', 180],
      \ "dark_gray": ['#252525', 235],
      \ "green": ['#2cf392', 85],
      \ "dark_red": ['#bb595c', 131],
      \ "bright_red": ['#e7477e', 168],
      \ "error_red": ['#ff0000', 9],
      \ "forest_blue": ['#31a6a5', 73],
      \ "bright_purple": ['#b581b0', 139],
      \ "bright_neon_blue": ['#00d4f8', 81],
      \ "baby_blue": ['#94ffff', 159],
      \ "extra_light_blue": ['#ccffff', 195],
      \ "rose": ['#ffd5d6', 224],
      \ "soft_pink": ['#f7eaf5', 225],
      \ "dark_stain_yellow": ['#bf0060', 125],
      \ "dark_dark_gray": ['#1b1b1b', 234],
      \ "dark_green": ['#0089ff', 33],
      \ "terminal_green": ['#96ba92', 115],
      \ "terminal_blue": ['#b8cfe6', 153],
      \ "dark_dark_red": ['#bb595c', 131],
      \ "dark_bright_red": ['#e75487', 168],
      \ "dark_forest_blue": ['#eb0089', 162],
      \ "dark_bright_purple": ['#6800b6', 55],
      \ "dark_bright_neon_blue": ['#0089ff', 33],
      \ "dark_baby_blue": ['#e482ff', 177],
      \ "dark_extra_light_blue": ['#444444', 238],
      \ "dark_rose": ['#ff7eda', 212],
      \ }
"bright_red": ['#e75487', 168],
"bright_purple": ['#b684b1', 139],
"bright_neon_blue": ['#00daff', 81],
"forest_blue": ['#3ab1b0', 73],
"stain_yellow": ['#dead80', 180],
"stain_yellow": ['#d5a579', 180],

function! backpack#GetColors()
  return s:colors
endfunction 

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
