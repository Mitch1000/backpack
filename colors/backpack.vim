" -----------------------------------------------------------------------------
" File: backpack.vim1
" Description: Retro color scheme for Vim
" Author: mitch1000 <mit.brohan@yahoo.ca>
" Source: https://github.com/mitch1000/backpack
" Last Modified: 25 April 2022
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='backpack'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:backpack_bold')
  let g:backpack_bold=1
endif
if !exists('g:backpack_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:backpack_italic=1
  else
    let g:backpack_italic=0
  endif
endif
if !exists('g:backpack_undercurl')
  let g:backpack_undercurl=1
endif
if !exists('g:backpack_underline')
  let g:backpack_underline=1
endif
if !exists('g:backpack_inverse')
  let g:backpack_inverse=1
endif

if !exists('g:backpack_guisp_fallback') || index(['fg', 'bg'], g:backpack_guisp_fallback) == -1
  let g:backpack_guisp_fallback='NONE'
endif

if !exists('g:backpack_improved_strings')
  let g:backpack_improved_strings=0
endif

if !exists('g:backpack_improved_warnings')
  let g:backpack_improved_warnings=0
endif

if !exists('g:backpack_termcolors')
  let g:backpack_termcolors=256
endif

if !exists('g:backpack_invert_indent_guides')
  let g:backpack_invert_indent_guides=0
endif

if exists('g:backpack_contrast')
  echo 'g:backpack_contrast is deprecated; use g:backpack_contrast_light and g:backpack_contrast_dark instead'
endif

if !exists('g:backpack_contrast_dark')
  let g:backpack_contrast_dark='medium'
endif

if !exists('g:backpack_contrast_light')
  let g:backpack_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:bp = {}

" fill it with colors
let s:bp.dark0_hard  = ['#1c1c1c', 234]
let s:bp.dark0 = ['#262626', 235]
let s:bp.dark0_soft = ['#303030', 236]
let s:bp.dark1 = ['#3a3a3a', 237]
let s:bp.dark2 = ['#4e4e4e', 239]
let s:bp.dark3 = ['#606060', 241]
let s:bp.dark4 = ['#767676', 243]
let s:bp.dark5 = ['#444444', 238]
let s:bp.dark6 = ['#606060', 241]
let s:bp.dark7 = ['#1c1c1c', 234]
let s:bp.dark8 = ['#303030', 236]
let s:bp.dark9 = ['#262626', 235]
let s:bp.dark10 = ['#1c1c1c', 234]
let s:bp.dark11 = ['#121212', 233]
let s:bp.dark4_256 = ['#767676', 243]

let s:bp.gray_246 = ['#949494', 246]
let s:bp.gray_245 = ['#8a8a8a', 245]
let s:bp.gray_244 = ['#808080', 244]

let s:bp.light0_hard = ['#ffffff', 231]
let s:bp.light0 = ['#ffffff', 231]
let s:bp.light0_soft = ['#e4e4e4', 254]
let s:bp.light1 = ['#eeeeee', 255]
let s:bp.light2 = ['#c6c6c6', 251]
let s:bp.light3 = ['#e4e4e4', 254]
let s:bp.light4 = ['#d0d0d0', 252]
let s:bp.light5 = ['#b2b2b2', 249]
let s:bp.light6 = ['#949494', 246]
let s:bp.light7 = ['#dadada', 253]
let s:bp.light8 = ['#c6c6c6', 251]
let s:bp.light9 = ['#eeeeee', 255]
let s:bp.light10 = ['#ffffff', 231]
let s:bp.light4_256  = ['#eeeeee', 255]

let s:bp.stain_yellow = ['#d7af87', 180]
let s:bp.dark_gray = ['#262626', 235]
let s:bp.green  = ['#87ffaf', 121]
let s:bp.dark_red = ['#af5f5f', 131]
let s:bp.bright_red = ['#d75f87', 168]
let s:bp.forest_blue = ['#5fafaf', 73]
let s:bp.bright_purple = ['#af87af', 139]
let s:bp.bright_neon_blue = ['#5fd7ff', 81]
let s:bp.baby_blue = ['#afffff', 159]
let s:bp.extra_light_blue = ['#d7ffff', 195]
let s:bp.rose = ['#ffd7d7', 224]

let s:bp.dark_stain_yellow = ['#af005f', 125]
let s:bp.dark_dark_gray = ['#1c1c1c', 234]
let s:bp.dark_green  = ['#0087ff', 33]
let s:bp.dark_dark_red = ['#af5f5f', 131]
let s:bp.dark_bright_red = ['#d75f87', 168]
let s:bp.dark_forest_blue = ['#d70087', 162]
let s:bp.dark_bright_purple = ['#5f00af', 55]
let s:bp.dark_bright_neon_blue = ['#0087ff', 33]
let s:bp.dark_baby_blue = ['#d787ff', 177]
let s:bp.dark_extra_light_blue = ['#444444', 238]
let s:bp.dark_rose = ['#ff87d7', 212]



" }}}
"
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:backpack_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:backpack_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:backpack_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:backpack_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:backpack_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:bp.dark0
  if g:backpack_contrast_dark == 'soft'
    let s:bg0  = s:bp.dark0_soft
  elseif g:backpack_contrast_dark == 'hard'
    let s:bg0  = s:bp.dark0_hard
  endif

  let s:bg1  = s:bp.dark1
  let s:bg2  = s:bp.dark2
  let s:bg3  = s:bp.dark3
  let s:bg4  = s:bp.dark4
  let s:bg5  = s:bp.dark5
  let s:bg6  = s:bp.dark6
  let s:bg7  = s:bp.dark7
  let s:bg8  = s:bp.dark8
  let s:bg9  = s:bp.dark9
  let s:bg10  = s:bp.dark10

  let s:gray = s:bp.gray_244
  let s:light_gray = s:bp.gray_245

  let s:fg0 = s:bp.light0
  let s:fg1 = s:bp.light1
  let s:fg2 = s:bp.light2
  let s:fg3 = s:bp.light3
  let s:fg4 = s:bp.light4
  let s:fg5 = s:bp.light5
  let s:fg6 = s:bp.light6
  let s:fg7 = s:bp.light7

  let s:fg4_256 = s:bp.light4_256

  let s:stain_yellow = s:bp.stain_yellow
  let s:yellow = s:bp.stain_yellow
  let s:rose = s:bp.rose
  let s:red = s:bp.dark_red
  let s:bright_red = s:bp.bright_red
  let s:dark_gray = s:bp.dark_gray
  let s:green = s:bp.green
  let s:blue = s:bp.forest_blue
  let s:purple = s:bp.bright_purple
  let s:neon_blue = s:bp.bright_neon_blue
  let s:baby_blue = s:bp.baby_blue
  let s:extra_light_blue = s:bp.extra_light_blue
else
  let s:bg0  = s:bp.light0
  if g:backpack_contrast_light == 'soft'
    let s:bg0  = s:bp.light0_soft
  elseif g:backpack_contrast_light == 'hard'
    let s:bg0  = s:bp.light0_hard
  endif

  let s:bg1  = s:bp.light1
  let s:bg2  = s:bp.light2
  let s:bg3  = s:bp.light3
  let s:bg4  = s:bp.light4
  let s:bg5  = s:bp.light5
  let s:bg6  = s:bp.light6
  let s:bg7  = s:bp.light7
  let s:bg8  = s:bp.light8
  let s:bg9  = s:bp.light9
  let s:bg10  = s:bp.light10

  let s:gray = s:bp.gray_244

  let s:fg0 = s:bp.dark0
  let s:fg1 = s:bp.dark5
  let s:fg2 = s:bp.dark6
  let s:fg3 = s:bp.dark7
  let s:fg4 = s:bp.dark8
  let s:fg5 = s:bp.dark9
  let s:fg6 = s:bp.dark10
  let s:fg7 = s:bp.dark11

  let s:fg4_256 = s:bp.dark4_256
  let s:light_gray = s:bp.dark6

  let s:stain_yellow = s:bp.dark_stain_yellow
  let s:bright_red = s:bp.dark_bright_red
  let s:yellow = s:bp.dark_stain_yellow
  let s:rose = s:bp.dark_rose
  let s:red = s:bp.dark_dark_red
  let s:dark_gray = s:bp.dark_dark_gray
  let s:green = s:bp.dark_green
  let s:blue = s:bp.dark_forest_blue
  let s:purple = s:bp.dark_bright_purple
  let s:neon_blue = s:bp.dark_bright_neon_blue
  let s:baby_blue = s:bp.dark_baby_blue
  let s:extra_light_blue = s:bp.dark_extra_light_blue
endif

" reset to 16 colors fallback
if g:backpack_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:stain_yellow[1] = 9
  let s:green[1]  = 10
  let s:green[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:neon_blue[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:bp.bg0 = s:bg0
let s:bp.bg1 = s:bg1
let s:bp.bg2 = s:bg2
let s:bp.bg3 = s:bg3
let s:bp.bg4 = s:bg4

let s:bp.gray = s:gray

let s:bp.fg0 = s:fg0
let s:bp.fg1 = s:fg1
let s:bp.fg2 = s:fg2
let s:bp.fg3 = s:fg3
let s:bp.fg4 = s:fg4

let s:bp.fg4_256 = s:fg4_256

let s:bp.red    = s:red
let s:bp.green  = s:green
let s:bp.yellow = s:stain_yellow
let s:bp.blue   = s:blue
let s:bp.purple = s:purple
let s:bp.neon_blue   = s:neon_blue
let s:bp.baby_blue = s:baby_blue
let s:bp.extra_light_blue = s:extra_light_blue

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:bp.neutral_red[0]
  let g:terminal_color_9 = s:stain_yellow[0]

  let g:terminal_color_2 = s:bp.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:bp.neutral_yellow[0]
  let g:terminal_color_11 = s:green[0]

  let g:terminal_color_4 = s:bp.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:bp.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:bp.neutral_neon_blue[0]
  let g:terminal_color_14 = s:neon_blue[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:baby_blue
if exists('g:backpack_hls_cursor')
  let s:hls_cursor = get(s:bp, g:backpack_hls_cursor)
endif

let s:number_column = s:none
if exists('g:backpack_number_column')
  let s:number_column = get(s:bp, g:backpack_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:backpack_sign_column')
    let s:sign_column = get(s:bp, g:backpack_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:backpack_color_column')
  let s:color_column = get(s:bp, g:backpack_color_column)
endif

let s:vert_split = s:bg0
if exists('g:backpack_vert_split')
  let s:vert_split = get(s:bp, g:backpack_vert_split)
endif

let s:invert_signs = ''
if exists('g:backpack_invert_signs')
  if g:backpack_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:backpack_invert_selection')
  if g:backpack_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:backpack_invert_tabline')
  if g:backpack_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:backpack_italicize_comments')
  if g:backpack_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:backpack_italicize_strings')
  if g:backpack_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:backpack_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:backpack_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
"  Hi Groups: {{{

" memoize common hi groups
call s:HL('BackpackFg0', s:fg0)
call s:HL('BackpackFg1', s:fg1)
call s:HL('BackpackFg2', s:fg2)
call s:HL('BackpackFg2Bold', s:fg2, s:none, s:bold)
call s:HL('BackpackFg3', s:fg3)
call s:HL('BackpackFg3Bold', s:fg3, s:none, s:bold)
call s:HL('BackpackFg4', s:fg4)
call s:HL('BackpackFg4Italic', s:fg4, s:none, s:italic)
call s:HL('BackpackFg5', s:fg5)
call s:HL('BackpackFg6', s:fg6)
call s:HL('BackpackFg7', s:fg7)
call s:HL('BackpackGray', s:gray)
call s:HL('BackpackBg0', s:bg0)
call s:HL('BackpackBg1', s:bg1)
call s:HL('BackpackBg2', s:bg2)
call s:HL('BackpackBg3', s:bg3)
call s:HL('BackpackBg4', s:bg4)
call s:HL('BackpackBg5', s:bg5)
call s:HL('BackpackBg6', s:bg6)
call s:HL('BackpackBg7', s:bg7)
call s:HL('BackpackBg8', s:bg8)
call s:HL('BackpackBg9', s:bg9)
call s:HL('BackpackBg10', s:bg10)

call s:HL('BackpackStainYellow', s:stain_yellow)
call s:HL('BackpackStainYellowBold', s:stain_yellow, s:none, s:bold)
call s:HL('BackpackDarkRed', s:red)
call s:HL('BackpackDarkRedBold', s:red, s:none, s:bold)
call s:HL('BackpackBrightRed', s:bright_red)
call s:HL('BackpackBrightRedBold', s:bright_red, s:none, s:bold)
call s:HL('BackpackGreen', s:green)
call s:HL('BackpackGreenBold', s:green, s:none, s:bold)
call s:HL('BackpackDarkRedBold', s:red, s:none, s:bold)
call s:HL('BackpackDarkGray', s:dark_gray)
call s:HL('BackpackYellow', s:stain_yellow)
call s:HL('BackpackRose', s:rose)
call s:HL('BackpackRoseBold', s:rose, s:none, s:bold)
call s:HL('BackpackYellowBold', s:stain_yellow, s:none, s:bold)
call s:HL('BackpackBlue', s:blue)
call s:HL('BackpackBlueBold', s:blue, s:none, s:bold)
call s:HL('BackpackPurple', s:purple)
call s:HL('BackpackPurpleBold', s:purple, s:none, s:bold)
call s:HL('BackpackNeonBlue', s:neon_blue)
call s:HL('BackpackNeonBlueBold', s:neon_blue, s:none, s:bold)
call s:HL('BackpackBabyBlue', s:baby_blue)
call s:HL('BackpackBabyBlueBold', s:baby_blue, s:none, s:bold)
call s:HL('BackpackExtraLightBlue', s:extra_light_blue)
call s:HL('BackpackExtraLightBlueBold', s:extra_light_blue, s:none, s:bold)

call s:HL('BackpackStainYellowSign', s:stain_yellow, s:sign_column, s:invert_signs)
call s:HL('BackpackDarkRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('BackpackGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('BackpackYellowSign', s:stain_yellow, s:sign_column, s:invert_signs)
call s:HL('BackpackBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('BackpackPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('BackpackNeonBlueSign', s:neon_blue, s:sign_column, s:invert_signs)
call s:HL('BackpackBabyBlueSign', s:baby_blue, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine', s:none, s:bg8)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:fg0, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:fg2, s:bg5, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
 call s:HL('CursorLineNr', s:fg4, s:bg0)
endif

hi! link NonText BackpackBg4
hi! link SpecialKey BackpackBg4

call s:HL ('Visual',s:none,  s:bg3)
hi! link VisualNOS Visual

call s:HL('Search',    s:fg2, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory BackpackPurpleBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title BackpackPurpleBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg BackpackFg3Bold
" Current mode message: -- INSERT --
hi! link ModeMsg BackpackFg3Bold
" 'Press enter' prompt and yes/no questions
hi! link Question BackpackBabyBlueBold
" Warning messages
hi! link WarningMsg BackpackStainYellowBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
if !exists('g:backpack_yellow_line_numbers')
  let g:backpack_yellow_line_numbers = 0
endif
if g:backpack_yellow_line_numbers == 1
  call s:HL('LineNr', s:stain_yellow, s:bg0)
else
  call s:HL('LineNr', s:light_gray, s:bg0)
endif

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:bg7)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:fg2, s:fg2, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

filetype detect
if &filetype != 'vue' && &filetype != 'html'
  if g:backpack_improved_strings == 0
      hi! link Special BackpackBabyBlue
  else
    call s:HL('Special', s:baby_blue, s:bg1, s:italicize_strings)
  endif
endif
autocmd FileType vue hi! link Special BackpackRose

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:dark_gray, s:fg3, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement BackpackStainYellow
" Function name
hi! link Function BackpackPurpleBold
" if, then, else, endif, swicth, etc.
hi! link Conditional BackpackStainYellow
" for, do, while, etc.
hi! link Repeat BackpackStainYellow
" case, default, etc.
hi! link Label BackpackStainYellow
" try, catch, throw
hi! link Exception BackpackStainYellow
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword BackpackFg2

hi! link Delimiter BackpackFg3

" Variable name
hi! link Identifier BackpackBlue

" Generic preprocessor
hi! link PreProc BackpackNeonBlue
" Preprocessor #include
hi! link Include BackpackNeonBlue
" Preprocessor #define
hi! link Define BackpackNeonBlue
" Same as Define
hi! link Macro BackpackNeonBlue
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit BackpackNeonBlue

" Generic constant
hi! link Constant BackpackPurple
" Character constant: 'c', '/n'
hi! link Character BackpackPurple
" String constant: "this is a string"
if g:backpack_improved_strings == 0
  call s:HL('String',  s:purple, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean BackpackPurple
" Number constant: 234, 0xff
hi! link Number BackpackPurple
" Floating point constant: 2.3e10
hi! link Float BackpackPurple

" Generic type
hi! link Type BackpackGreen
" static, register, volatile, etc
hi! link StorageClass BackpackBabyBlue
" struct, union, enum, etc.
hi! link Structure BackpackNeonBlue
" typedef
hi! link Typedef BackpackYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:stain_yellow, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
call s:HL('DiffChange', s:bg0, s:blue)
call s:HL('DiffText',   s:bg0, s:green)

" Alternative setting
call s:HL('DiffChange', s:neon_blue, s:bg0, s:inverse)
call s:HL('DiffText',   s:green, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:backpack_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:stain_yellow)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:neon_blue)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:backpack_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:.gbt_colorpairs')
  let g:.gbt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:.gbt_colorpairs
let g:niji_light_colours = g:.gbt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd BackpackPurpleSign
hi! link GitGutterChange BackpackNeonBlueSign
hi! link GitGutterDelete BackpackStainYellowSign
hi! link GitGutterChangeDelete BackpackNeonBlueSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile BackpackPurple
hi! link gitcommitDiscardedFile BackpackStainYellow

" }}}
" Signify: {{{

hi! link SignifySignAdd BackpackPurpleSign
hi! link SignifySignChange BackpackNeonBlueSign
hi! link SignifySignDelete BackpackStainYellowSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:green)

hi! link SyntasticErrorSign BackpackStainYellowSign
hi! link SyntasticWarningSign BackpackYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   BackpackBlueSign
hi! link SignatureMarkerText BackpackPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl BackpackBlueSign
hi! link ShowMarksHLu BackpackBlueSign
hi! link ShowMarksHLo BackpackBlueSign
hi! link ShowMarksHLm BackpackBlueSign

" }}}
" CtrlP: {{{
"

hi! link CtrlPMatch BackpackYellow
hi! link CtrlPNoEntries BackpackStainYellow
hi! link CtrlPPrtBase BackpackBg2
hi! link CtrlPPrtCursor BackpackFg2
hi! link CtrlPLinePre BackpackBg2

call s:HL('CtrlPMode1', s:fg2, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:fg2, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket BackpackFg3
hi! link StartifyFile BackpackFg31
hi! link StartifyNumber BackpackBlue
hi! link StartifyPath BackpackGray
hi! link StartifySlash BackpackGray
hi! link StartifySection BackpackYellow
hi! link StartifySpecial BackpackBg2
hi! link StartifyHeader BackpackBabyBlue
hi! link StartifyFooter BackpackBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:stain_yellow[0], s:green[0], s:green[0],
  \ s:blue[0], s:purple[0], s:neon_blue[0], s:fg4[0],
  \ s:bg0[0], s:stain_yellow[0], s:green[0], s:baby_blue[0],
  \ s:blue[0], s:purple[0], s:neon_blue[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:green)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign BackpackStainYellowSign
hi! link ALEWarningSign BackpackYellowSign
hi! link ALEInfoSign BackpackBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail BackpackNeonBlue
hi! link DirvishArg BackpackYellow

" }}}
" Netrw: {{{

hi! link netrwDir BackpackNeonBlue
hi! link netrwClassify BackpackNeonBlue
hi! link netrwLink BackpackGray
hi! link netrwSymLink BackpackFg1
hi! link netrwExe BackpackYellow
hi! link netrwComment BackpackGray
hi! link netrwList BackpackBlue
hi! link netrwHelpCmd BackpackNeonBlue
hi! link netrwCmdSep BackpackFg3
hi! link netrwVersion BackpackPurple

" }}}
" NERDTree: {{{

hi! link NERDTreeDir BackpackNeonBlue
hi! link NERDTreeDirSlash BackpackNeonBlue

hi! link NERDTreeOpenable BackpackBabyBlue
hi! link NERDTreeClosable BackpackBabyBlue

hi! link NERDTreeFile BackpackFg1
hi! link NERDTreeExecFile BackpackYellow

hi! link NERDTreeUp BackpackGray
hi! link NERDTreeCWD BackpackPurple
hi! link NERDTreeHelp BackpackFg1

hi! link NERDTreeToggleOn BackpackPurple
hi! link NERDTreeToggleOff BackpackStainYellow

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign BackpackStainYellowSign
hi! link CocWarningSign BackpackBabyBlueSign
hi! link CocInfoSign BackpackYellowSign
hi! link CocHintSign BackpackBlueSign
hi! link CocErrorFloat BackpackStainYellow
hi! link CocWarningFloat BackpackBabyBlue
hi! link CocInfoFloat BackpackYellow
hi! link CocHintFloat BackpackBlue
hi! link CocDiagnosticsError BackpackStainYellow
hi! link CocDiagnosticsWarning BackpackBabyBlue
hi! link CocDiagnosticsInfo BackpackYellow
hi! link CocDiagnosticsHint BackpackBlue

hi! link CocSelectedText BackpackStainYellow
hi! link CocCodeLens BackpackGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:stain_yellow)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:baby_blue)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:fg2)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded BackpackPurple
hi! link diffRemoved BackpackStainYellow
hi! link diffChanged BackpackNeonBlue

hi! link diffFile BackpackBabyBlue
hi! link diffNewFile BackpackYellow

hi! link diffLine BackpackBlue

" }}}
" Html: {{{

hi! link htmlTag BackpackBlue
hi! link htmlEndTag BackpackBlue

hi! link htmlTagName BackpackYellow
hi! link htmlArg BackpackGreen

hi! link htmlScriptTag BackpackPurple
hi! link htmlTagN BackpackFg1
hi! link htmlSpecialTagName BackpackYellowBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar BackpackBabyBlue

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag BackpackBlue
hi! link xmlEndTag BackpackBlue
hi! link xmlTagName BackpackBlue
hi! link xmlEqual BackpackBlue
hi! link docbkKeyword BackpackNeonBlueBold

hi! link xmlDocTypeDecl BackpackGray
hi! link xmlDocTypeKeyword BackpackPurple
hi! link xmlCdataStart BackpackGray
hi! link xmlCdataCdata BackpackPurple
hi! link dtdFunction BackpackGray
hi! link dtdTagName BackpackPurple

hi! link xmlAttrib BackpackNeonBlue
hi! link xmlProcessingDelim BackpackGray
hi! link dtdParamEntityPunct BackpackGray
hi! link dtdParamEntityDPunct BackpackGray
hi! link xmlAttribPunct BackpackGray

hi! link xmlEntity BackpackBabyBlue
hi! link xmlEntityPunct BackpackBabyBlue
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)


hi! link vimLet BackpackGreen
hi! link vimNotation BackpackBabyBlue
hi! link vimBracket BackpackFg1
hi! link vimNumber BackpackFg3
hi! link vimMapModKey BackpackBabyBlue
hi! link vimFuncSID BackpackNeonBlue
hi! link vimSetSep BackpackFg3
hi! link vimSep BackpackFg3
hi! link vimContinue BackpackFg3
hi! link vimTodo BackpackDarkRed
hi! link vimType BackpackGreen
hi! link vimFuncName BackpackDarkRed
hi! link vimCommand BackpackStainYellow
hi! link vimFunc BackpackBabyBlue
hi! link vimVar BackpackBlue
hi! link vimFuncVar BackpackFg3
hi! link vimString BackpackPurple
hi! link vimFunction BackpackFg3
hi! link vimBracket BackpackFg2

" }}}
" Clojure: {{{

hi! link clojureKeyword BackpackBlue
hi! link clojureCond BackpackBabyBlue
hi! link clojureSpecial BackpackBabyBlue
hi! link clojureDefine BackpackBabyBlue

hi! link clojureFunc BackpackYellow
hi! link clojureRepeat BackpackYellow
hi! link clojureCharacter BackpackNeonBlue
hi! link clojureStringEscape BackpackNeonBlue
hi! link clojureException BackpackStainYellow

hi! link clojureRegexp BackpackNeonBlue
hi! link clojureRegexpEscape BackpackNeonBlue
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen BackpackFg3
hi! link clojureAnonArg BackpackYellow
hi! link clojureVariable BackpackBlue
hi! link clojureMacro BackpackBabyBlue

hi! link clojureMeta BackpackYellow
hi! link clojureDeref BackpackYellow
hi! link clojureQuote BackpackYellow
hi! link clojureUnquote BackpackYellow

" }}}
" C: {{{

hi! link cOperator BackpackPurple
hi! link cStructure BackpackBabyBlue

" }}}
" Python: {{{

hi! link pythonBuiltin BackpackGreen
hi! link pythonStatement BackpackYellow
hi! link pythonBuiltinObj BackpackBabyBlue
hi! link pythonBuiltinFunc BackpackBabyBlue
hi! link pythonFunction BackpackNeonBlue
hi! link pythonDecorator BackpackBabyBlue
hi! link pythonDecoratorName BackpackBabyBlue
hi! link pythonInclude BackpackBlue
hi! link pythonImport BackpackBlue
hi! link pythonRun BackpackBlue
hi! link pythonCoding BackpackBlue
hi! link pythonOperator BackpackStainYellow
hi! link pythonException BackpackStainYellow
hi! link pythonExceptions BackpackPurple
hi! link pythonBoolean BackpackPurple
hi! link pythonDot BackpackFg3
hi! link pythonConditional BackpackStainYellow
hi! link pythonRepeat BackpackStainYellow
hi! link pythonDottedName BackpackPurpleBold

" }}}
" JavaScript: {{{

call s:HL('javaScriptComment', s:blue, s:none, s:italic . s:italicize_comments)

hi! link javaScriptBraces BackpackFg1
hi! link javaScriptFunction BackpackBlue
hi! link javaScriptIdentifier BackpackStainYellow
hi! link javaScriptMember BackpackNeonBlue
hi! link javaScriptNumber BackpackPurple
hi! link javaScriptString BackpackPurple
hi! link javaScriptNull BackpackPurple
hi! link javaScriptParens BackpackFg3
hi! link javaScriptReserved BackpackYellow
hi! link javaScriptFunction BackpackBlue
hi! link javaScriptIdentifier BackpackBlue
hi! link javaScriptGlobal BackpackNeonBlue
hi! link javaScriptStatement BackpackYellow
hi! link javaScriptType BackpackGreen

" }}}
"
" YAJS: {{{

hi! link javascriptFuncName BackpackGreen
hi! link javascriptFuncArg BackpackExtraLightBlue
hi! link javascriptFuncCall BackpackExtraLightBlue
hi! link javascriptMethod BackpackExtraLightBlue
hi! link javascriptImport BackpackNeonBlue
hi! link javascriptExport BackpackNeonBlue
hi! link javascriptClassKeyword BackpackNeonBlue
hi! link javascriptClassExtends BackpackNeonBlue
hi! link javascriptDefault BackpackYellow

hi! link javascriptClassName BackpackYellow
hi! link javascriptClassSuperName BackpackYellow
hi! link javascriptGlobal BackpackYellow

hi! link javascriptEndColons BackpackFg1
hi! link javascriptGlobalMethod BackpackFg1
hi! link javascriptNodeGlobal BackpackFg1
hi! link javascriptBOMWindowProp BackpackExtraFg1
hi! link javascriptArrayMethod BackpackFg1
hi! link javascriptArrayStaticMethod BackpackFg1
hi! link javascriptCacheMethod BackpackFg1
hi! link javascriptDateMethod BackpackFg1
hi! link javascriptMathStaticMethod BackpackFg1

hi! link javascriptProp BackpackFg1
hi! link javascriptURLUtilsProp BackpackFg1
hi! link javascriptDOMDocMethod BackpackFg1
hi! link javascriptDOMDocProp BackpackFg1
hi! link javascriptBOMLocationMethod BackpackFg1
hi! link javascriptBOMWindowMethod BackpackFg1
hi! link javascriptStringMethod BackpackFg1

hi! link javascriptVariable BackpackBabyBlue
hi! link javascriptVariable BackpackStainYellow
hi! link javascripttdentifier BackpackBlue
hi! link javascriptIdentifierName BackpackRose
hi! link javascriptClassSuper BackpackBabyBlue
hi! link javascriptString BackpackPurple

hi! link javascriptFuncKeyword BackpackBabyBlue
hi! link javascriptAsyncFunc BackpackBabyBlue
hi! link javascriptFuncKeyword BackpackBlue
hi! link javascriptAsyncFunc BackpackNeonBlue
hi! link javascriptClassStatic BackpackBabyBlue

hi! link javascriptOperator BackpackBrightRed
hi! link javascriptForOperator BackpackStainYellow
hi! link javascriptYield BackpackStainYellow
hi! link javascriptExceptions BackpackStainYellow
hi! link javascriptMessage BackpackStainYellow

hi! link javascriptTemplateSB BackpackNeonBlue
hi! link javascriptTemplateSubstitution BackpackFg1

hi! link javascriptLabel BackpackBlueBold
hi! link javascriptObjectLabel BackpackFg2
hi! link javascriptPropertyName BackpackYellow

hi! link javascriptLogicSymbols BackpackFg1
hi! link javascriptArrowFunc BackpackRose

hi! link javascriptDocParamName BackpackFg4
hi! link javascriptDocTags BackpackFg4
hi! link javascriptDocNotation BackpackFg4
hi! link javascriptDocParamType BackpackFg4
hi! link javascriptDocNamedParamType BackpackFg4


hi! link javascriptBrackets BackpackFg1
hi! link javascriptDOMElemAttrs BackpackFg1
hi! link javascriptDOMEventMethod BackpackFg1
hi! link javascriptDOMNodeMethod BackpackFg1
hi! link javascriptDOMStorageMethod BackpackFg1
hi! link javascriptHeadersMethod BackpackFg1

hi! link javascriptAsyncFuncKeyword BackpackStainYellow
hi! link javascriptAwaitFuncKeyword BackpackStainYellow

hi! link javascriptImport BackpackYellow
hi! link javascriptExport BackpackNeonBlue
hi! link javascriptPropertyName BackpackYellow
hi! link javascriptProp BackpackYellow
hi! link javascriptClassKeyword BackpackGreen
hi! link javascriptObjectMethodName BackpackExtraLightBlue
hi! link javascriptObjectMethod     BackpackExtraLightBlue
hi! link javascriptMethodName       BackpackExtraLightBlue
hi! link javascriptMethodName       BackpackExtraLightBlue
hi! link javascriptMethodAccessor   BackpackExtraLightBlue
hi! link javascriptMethodName       BackpackExtraLightBlue
hi! link javascriptMethod       BackpackExtraLightBlue
hi! link javascriptFuncCall       BackpackExtraLightBlue


" }}}
" PanglossJS: {{{
hi! link jsImport BackpackYellow
hi! link jsExport BackpackYellow
hi! link jsFrom BackpackNeonBlue
hi! link jsObjectProp BackpackFg1
hi! link jsArrowFunction BackpackRose
hi! link jsClassKeyword BackpackYellow
hi! link jsExtendsKeyword BackpackGreen
hi! link jsExportDefault BackpackYellow
hi! link jsTemplateBraces BackpackNeonBlue
hi! link jsFunction BackpackBlue
hi! link jsFuncParens BackpackFg3
hi! link jsParens BackpackFg1
hi! link jsNull BackpackPurple
hi! link jsUndefined BackpackDarkRed
hi! link jsFuncName BackpackPurple
hi! link jsReturn BackpackYellow
hi! link jsFuncName BackpackGreen
hi! link jsClassKeyword  BackpackGreen
hi! link jsClassFuncName  BackpackGreen
hi! link jsLet BackpackBlue
hi! link jsStorageClass BackpackYellow
hi! link jsObject BackpackBabyBlue
hi! link jsObjectFuncName BackpackGreen
hi! link jsSpecial BackpackGreen
hi! link jsThis BackpackBlue
hi! link jsGlobalNodeObjects BackpackNeonBlue
hi! link jsOperatorKeyword BackpackBrightRed
hi! link jsGlobalObjects BackpackNeonBlue
hi! link jsFuncCall BackpackExtraLightBlue
hi! link jsFuncArgs BackpackFg5
hi! link jsVariableDef BackpackFg1
hi! link jsObjectKey BackpackFg2
hi! link jsFuncBlock BackpackFg1
"jsFuncBlocks is THREE.Scene()  the defined object before the .


" }}}
" TypeScript: {{{

hi! link typeScriptReserved BackpackNeonBlue
hi! link typeScriptLabel BackpackNeonBlue
hi! link typeScriptFuncKeyword BackpackBlue
hi! link typeScriptIdentifier BackpackBabyBlue
hi! link typeScriptBraces BackpackFg1
hi! link typeScriptEndColons BackpackFg1
hi! link typeScriptDOMObjects BackpackFg1
hi! link typeScriptAjaxMethods BackpackFg1
hi! link typeScriptLogicSymbols BackpackFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects BackpackFg1
hi! link typeScriptParens BackpackFg3
hi! link typeScriptOpSymbols BackpackFg3
hi! link typeScriptHtmlElemProperties BackpackFg1
hi! link typeScriptNull BackpackPurple
hi! link typeScriptInterpolationDelimiter BackpackNeonBlue

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword BackpackNeonBlue
hi! link purescriptModuleName BackpackFg1
hi! link purescriptWhere BackpackNeonBlue
hi! link purescriptDelimiter BackpackFg4
hi! link purescriptType BackpackFg1
hi! link purescriptImportKeyword BackpackDarkRed
hi! link purescriptHidingKeyword BackpackNeonBlue
hi! link purescriptAsKeyword BackpackNeonBlue
hi! link purescriptStructure BackpackNeonBlue
hi! link purescriptOperator BackpackBlue

hi! link purescriptTypeVar BackpackFg1
hi! link purescriptConstructor BackpackFg1
hi! link purescriptFunction BackpackFg1
hi! link purescriptConditional BackpackBabyBlue
hi! link purescriptBacktick BackpackBabyBlue

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp BackpackFg3
hi! link coffeeSpecialOp BackpackFg3
hi! link coffeeCurly BackpackBabyBlue
hi! link coffeeParen BackpackFg3
hi! link coffeeBracket BackpackBabyBlue

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter BackpackPurple
hi! link rubyFunction BackpackBlue
hi! link rubyInterpolationDelimiter BackpackNeonBlue

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier BackpackStainYellow
hi! link objcDirective BackpackBlue

" }}}
" Go: {{{

hi! link goDirective BackpackNeonBlue
hi! link goConstants BackpackPurple
hi! link goDeclaration BackpackStainYellow
hi! link goDeclType BackpackBlue
hi! link goBuiltins BackpackBabyBlue

" }}}
" Lua: {{{

hi! link luaIn BackpackStainYellow
hi! link luaFunction BackpackNeonBlue
hi! link luaTable BackpackBabyBlue

" }}}
" MoonScript: {{{

hi! link moonSpecialOp BackpackFg3
hi! link moonExtendedOp BackpackFg3
hi! link moonFunction BackpackFg3
hi! link moonObject BackpackYellow

" }}}
" Java: {{{
hi! link javaAnnotation BackpackBlue
hi! link javaDocTags BackpackNeonBlue
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen BackpackFg3
hi! link javaParen1 BackpackFg3
hi! link javaParen2 BackpackFg3
hi! link javaParen3 BackpackFg3
hi! link javaParen4 BackpackFg3
hi! link javaParen5 BackpackFg3
hi! link javaOperator BackpackBabyBlue

hi! link javaVarArg BackpackPurple

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter BackpackPurple
hi! link elixirInterpolationDelimiter BackpackNeonBlue

hi! link elixirModuleDeclaration BackpackYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition BackpackFg1
hi! link scalaCaseFollowing BackpackFg1
hi! link scalaCapitalWord BackpackFg1
hi! link scalaTypeExtension BackpackFg1

hi! link scalaKeyword BackpackStainYellow
hi! link scalaKeywordModifier BackpackStainYellow

hi! link scalaSpecial BackpackNeonBlue
hi! link scalaOperator BackpackFg1

hi! link scalaTypeDeclaration BackpackYellow
hi! link scalaTypeTypePostDeclaration BackpackYellow

hi! link scalaInstanceDeclaration BackpackFg1
hi! link scalaInterpolation BackpackNeonBlue

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 BackpackPurpleBold
hi! link markdownH2 BackpackPurpleBold
hi! link markdownH3 BackpackYellowBold
hi! link markdownH4 BackpackYellowBold
hi! link markdownH5 BackpackYellow
hi! link markdownH6 BackpackYellow

hi! link markdownCode BackpackNeonBlue
hi! link markdownCodeBlock BackpackNeonBlue
hi! link markdownCodeDelimiter BackpackNeonBlue

hi! link markdownBlockquote BackpackGray
hi! link markdownListMarker BackpackGray
hi! link markdownOrderedListMarker BackpackGray
hi! link markdownRule BackpackGray
hi! link markdownHeadingRule BackpackGray

hi! link markdownUrlDelimiter BackpackFg3
hi! link markdownLinkDelimiter BackpackFg3
hi! link markdownLinkTextDelimiter BackpackFg3

hi! link markdownHeadingDelimiter BackpackBabyBlue
hi! link markdownUrl BackpackPurple
hi! link markdownUrlTitleDelimiter BackpackGray
hi! link markdownUrlTitle BackpackGray

call s:HL('markdownLinkText', s:green, s:none, s:underline)
call s:HL('markdownUrlTitle', s:gray, s:none, s:italic)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType BackpackYellow
" hi! link haskellOperators BackpackBabyBlue
" hi! link haskellConditional BackpackNeonBlue
" hi! link haskellLet BackpackBabyBlue
"
hi! link haskellType BackpackFg1
hi! link haskellIdentifier BackpackFg1
hi! link haskellSeparator BackpackFg1
hi! link haskellDelimiter BackpackFg4
hi! link haskellOperators BackpackBlue
"
hi! link haskellBacktick BackpackBabyBlue
hi! link haskellStatement BackpackBabyBlue
hi! link haskellConditional BackpackBabyBlue

hi! link haskellLet BackpackNeonBlue
hi! link haskellDefault BackpackNeonBlue
hi! link haskellWhere BackpackNeonBlue
hi! link haskellBottom BackpackNeonBlue
hi! link haskellBlockKeywords BackpackNeonBlue
hi! link haskellImportKeywords BackpackNeonBlue
hi! link haskellDeclKeyword BackpackNeonBlue
hi! link haskellDeriving BackpackNeonBlue
hi! link haskellAssocType BackpackNeonBlue

hi! link haskellNumber BackpackPurple
hi! link haskellPragma BackpackPurple

hi! link haskellString BackpackPurple
hi! link haskellChar BackpackPurple

" }}}
" Json: {{{

hi! link jsonKeyword BackpackPurple
hi! link jsonQuote BackpackPurple
hi! link jsonBraces BackpackFg1
hi! link jsonString BackpackFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! BackpackHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! BackpackHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
