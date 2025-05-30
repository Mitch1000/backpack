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

let s:colors = backpack#GetColors()

if exists('g:lightline')
  let s:bg_dark = s:colors.dark0_hard
  let s:bg_darker = s:colors.dark0_harder
  let s:bg_soft = s:colors.dark0_soft
  let s:bg0  = s:colors.dark0
  let s:bg1  = s:colors.dark1
  let s:bg2  = s:colors.dark2
  let s:bg3  = s:colors.dark3
  let s:bg4  = s:colors.dark4
  let s:bg5  = s:colors.dark5
  let s:bg9  = s:colors.dark9
  let s:bg10  = s:colors.dark10
  let s:fg1  = s:colors.light1
  let s:fg2  = s:colors.light2
  let s:fg3  = s:colors.light3
  let s:fg4  = s:colors.light4
  let s:fg7  = s:colors.light7
  let s:fg8  = s:colors.light8

  let s:yellow = s:colors.stain_yellow
  let s:purple = s:colors.purple
  let s:blue   = s:colors.blue
  let s:baby_blue  = s:colors.baby_blue
  let s:rose = s:colors.rose
  let s:green = s:colors.green
  let s:red = s:colors.bright_red
  let s:dark_red = s:colors.dark_red
  let s:light_blue = s:colors.extra_light_blue
  let s:terminal_blue = s:colors.terminal_blue

  let s:is_dark=(&background == 'dark')

  if s:is_dark
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
    let s:p.terminal.left = [ [ s:bg0, s:terminal_blue, 'bold' ], [ s:bg0, s:purple ] ]
    let s:p.terminal.right = [ [ s:bg0, s:terminal_blue ], [ s:bg0, s:purple ] ]
    let s:p.terminal.middle = [ [ s:fg4, s:bg1 ] ]
    let s:p.replace.left = [ [ s:bg0, s:rose, 'bold' ], [ s:fg1, s:bg2 ] ]
    let s:p.replace.right = [ [ s:bg0, s:rose ], [ s:fg1, s:bg2 ] ]
    let s:p.replace.middle = [ [ s:fg4, s:bg2 ] ]
    let s:p.visual.left = [ [ s:bg0, s:yellow, 'bold' ], [ s:bg0, s:bg4 ] ]
    let s:p.visual.right = [ [ s:bg0, s:yellow ], [ s:bg0, s:bg4 ] ]
    let s:p.visual.middle = [ [ s:fg4, s:bg1 ] ]
    let s:p.tabline.left = [ [ s:fg2, s:bg_soft ] ]
    let s:p.tabline.tabsel = [ [ s:fg2, s:bg2 ] ]
    let s:p.tabline.middle = [ [ s:bg_dark, s:bg_dark ] ]
    let s:p.tabline.right = [ [ s:bg0, s:blue ] ]
    let s:p.normal.error = [ [ s:bg0, s:red ] ]
    let s:p.normal.warning = [ [ s:bg2, s:yellow ] ]
  else
    let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
    let s:p.normal.left = [ [ s:bg9, s:fg2, 'bold' ], [ s:fg2, s:bg2 ] ]
    let s:p.normal.right = [ [ s:bg9, s:fg2 ], [ s:fg2, s:bg2 ] ]
    let s:p.normal.middle = [ [ s:fg2, s:bg0 ] ]
    let s:p.inactive.right = [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
    let s:p.inactive.left =  [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
    let s:p.inactive.middle = [ [ s:bg10, s:bg1 ] ]
    let s:p.insert.left = [ [ s:bg10, s:red, 'bold' ], [ s:bg9, s:fg2 ] ]
    let s:p.insert.right = [ [ s:bg10, s:red ], [ s:bg9, s:fg2 ] ]
    let s:p.insert.middle = [ [ s:fg2, s:bg3 ] ]
    let s:p.terminal.left = [ [ s:bg2, s:rose, 'bold' ], [ s:fg1, s:bg0 ] ]
    let s:p.terminal.right = [ [ s:bg2, s:rose ], [ s:fg1, s:bg0 ] ]
    let s:p.terminal.middle = [ [ s:fg2, s:bg2 ] ]
    let s:p.replace.left = [ [ s:bg0, s:yellow, 'bold' ], [ s:fg1, s:bg2 ] ]
    let s:p.replace.right = [ [ s:bg0, s:yellow ], [ s:fg1, s:bg2 ] ]
    let s:p.replace.middle = [ [ s:fg2, s:bg2 ] ]
    let s:p.visual.left = [ [ s:fg7, s:terminal_blue, 'bold' ], [ s:fg8, s:bg1 ] ]
    let s:p.visual.right = [ [ s:fg7, s:terminal_blue ], [ s:fg8, s:bg1 ] ]
    let s:p.visual.middle = [ [ s:fg2, s:bg2 ] ]
    let s:p.tabline.left = [ [ s:fg2, s:bg2 ] ]
    let s:p.tabline.tabsel = [ [ s:bg0, s:fg2 ] ]
    let s:p.tabline.middle = [ [ s:bg0, s:bg0 ] ]
    let s:p.tabline.right = [ [ s:bg0, s:blue ] ]
    let s:p.normal.error = [ [ s:bg0, s:red ] ]
    let s:p.normal.warning = [ [ s:bg2, s:yellow ] ]
  endif
  let g:lightline#colorscheme#backpack#palette = lightline#colorscheme#flatten(s:p)
endif
