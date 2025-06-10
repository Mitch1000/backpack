# Backpack - A Vim Color Scheme

Backpack is simple vim and neovim color scheme heavily inspired by [gruvbox](https://github.com/morhetz/gruvbox), and the Iterm2 color theme [Neutron](https://github.com/mbadolato/iTerm2-Color-Schemes)

A simple Retro theme.

Feedback is appreciated!

Typeface from screenshots below is [Monaco Nerd Font](https://github.com/Karmenzind/monaco-nerd-fonts)

Palette
-------------

![Palette](https://github.com/user-attachments/assets/c737ef18-8237-48ca-b787-255f058dee48)

Dark mode
-------------

<img width="1781" alt="Screen Shot 2022-04-27 at 11 24 28 AM" src="https://user-images.githubusercontent.com/19654528/165554966-64e02997-4993-4024-868d-a3ba8c7d0d52.png">

<img width="1777" alt="Screen Shot 2022-05-03 at 2 08 48 PM" src="https://user-images.githubusercontent.com/19654528/166515689-82583677-f347-456f-8d7b-7d6d675ded71.png">

Installation Method
-------------

    Pathogen
        git clone https://github.com/Mitch1000/backpack.git ~/.vim/bundle/backpack

    Vundle
        Add Plugin 'Mitch1000/backpack' to your .vimrc and run :PluginInstall

    Dein
        Add the following to your .vimrc, and run call dein#install():

    call dein#add('Mitch1000/backpack')

    vim-plug
        Add Plug 'Mitch1000/backpack to your .vimrc and run :PlugInstall
        
    Packer
        use {'mitch1000/backpack' }

    Lazy
        {
          'mitch1000/backpack',
          config = function ()
            vim.g.italicize_comments = 1
            vim.g.backpack_italic = 1
            vim.g.backpack_contrast_dark = "medium" -- soft hard medium
          end
        },

Then add `colorscheme backpack` to your `vimrc` file.

OR

```lua
 vim.g.my_color_scheme = 'backpack'
 vim.cmd('colorscheme ' .. vim.g.my_color_scheme)
```

to your `init.lua` file.

### Options

NOTE: If you are using iTerm2, you may want to use the sRGB color space for more accurate color reproduction. 
There is an option to disable P3 colors in the Advanced Settings tab.

```lua
 vim.o.background = 'dark'
 vim.g.italicize_comments = 1
 vim.g.backpack_italic = 1
 vim.g.backpack_contrast_dark = "medium" -- soft medium hard harder
 vim.g.backpack_contrast_light = "medium" -- soft medium hard harder 
 vim.g.backpack_transparent = true  -- true or false
```

### 256 Color Support!

To use 256 colors use `vim.cmd([[ set notermguicolors ]])` after the color scheme has loaded.


License
-------
[MIT/X11][]

   [MIT/X11]: https://en.wikipedia.org/wiki/MIT_License

