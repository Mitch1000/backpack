" -----------------------------------------------------------------------------
" File: backpack.vim
" Description: Backpack colorscheme for Lightline
" Author: mitch1000 <mitt.brohan@yahoo.ca>
" Source: https://github.com/mitch1000/backpack
" Last Modified: 26 April 2022
" -----------------------------------------------------------------------------

function! s:getBackpackColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui") 
  let termColor = synIDattr(hlID(a:group), "fg", "cterm") 
  return [ guiColor, termColor ]
endfunction

if exists('g:lightline')

  let s:bg0  = s:getBackpackColor('BackpackBg0')
  let s:bg1  = s:getBackpackColor('BackpackBg1')
  let s:bg2  = s:getBackpackColor('BackpackBg2')
  let s:bg4  = s:getBackpackColor('BackpackBg4')
  let s:fg1  = s:getBackpackColor('BackpackFg1')
  let s:fg2  = s:getBackpackColor('BackpackFg2')
  let s:fg4  = s:getBackpackColor('BackpackFg4')

  let s:yellow = s:getBackpackColor('BackpackStainYellow')
  let s:purple = s:getBackpackColor('BackpackPurple')
  let s:blue   = s:getBackpackColor('BackpackBlue')
  let s:baby_blue   = s:getBackpackColor('BackpackBabyBlue')
  let s:aqua   = s:getBackpackColor('BackpackAqua')
  let s:green = s:getBackpackColor('BackpackGreen')
  let s:red = s:getBackpackColor('BackpackRed')
  let s:light_blue = s:getBackpackColor('BackpackExtraLightBlue')

  let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
  let s:p.normal.left = [ [ s:bg0, s:fg1, 'bold' ], [ s:fg4, s:bg1 ] ]
  let s:p.normal.right = [ [ s:bg0, s:fg4 ], [ s:fg4, s:bg2 ] ]
  let s:p.normal.middle = [ [ s:fg4, s:bg1 ] ]
  let s:p.inactive.right = [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
  let s:p.inactive.left =  [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
  let s:p.inactive.middle = [ [ s:bg4, s:bg1 ] ]
  let s:p.insert.left = [ [ s:bg0, s:purple, 'bold' ], [ s:fg1, s:bg2 ] ]
  let s:p.insert.right = [ [ s:bg0, s:fg2 ], [ s:fg1, s:bg2 ] ]
  let s:p.insert.middle = [ [ s:fg4, s:bg2 ] ]
  let s:p.terminal.left = [ [ s:bg0, s:green, 'bold' ], [ s:fg1, s:bg2 ] ]
  let s:p.terminal.right = [ [ s:bg0, s:green ], [ s:fg1, s:bg2 ] ]
  let s:p.terminal.middle = [ [ s:fg4, s:bg2 ] ]
  let s:p.replace.left = [ [ s:bg0, s:aqua, 'bold' ], [ s:fg1, s:bg2 ] ]
  let s:p.replace.right = [ [ s:bg0, s:aqua ], [ s:fg1, s:bg2 ] ]
  let s:p.replace.middle = [ [ s:fg4, s:bg2 ] ]
  let s:p.visual.left = [ [ s:bg0, s:yellow, 'bold' ], [ s:bg0, s:bg4 ] ]
  let s:p.visual.right = [ [ s:bg0, s:yellow ], [ s:bg0, s:bg4 ] ]
  let s:p.visual.middle = [ [ s:fg4, s:bg1 ] ]
  let s:p.tabline.left = [ [ s:fg4, s:bg2 ] ]
  let s:p.tabline.tabsel = [ [ s:bg0, s:fg4 ] ]
  let s:p.tabline.middle = [ [ s:bg0, s:bg0 ] ]
  let s:p.tabline.right = [ [ s:bg0, s:blue ] ]
  let s:p.normal.error = [ [ s:bg0, s:red ] ]
  let s:p.normal.warning = [ [ s:bg2, s:yellow ] ]

  let g:lightline#colorscheme#backpack#palette = lightline#colorscheme#flatten(s:p)
endif
