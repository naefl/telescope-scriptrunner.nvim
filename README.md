# telescope-scriptrunner.nvim

`telescope-scriptrunner` is an extension for [telescope.nvim][] that provides its users with the ability to easily run and
edit pre-written scripts

[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[vim-floaterm](https://github.com/voldikss/vim-floaterm)

## Installation

```lua
-- packer.nvim:
use { 'nvim-telescope/telescope-scriptrunner.nvim',
  requires = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/popup.nvim'},
    {'voldikss/vim-floaterm'},
  },
  config = function()
    require'telescope'.load_extension'scriptrunner'
    -- ... other telescope settings
  end,
}
...
-- paq-nvim:
paq 'nvim-lua/plenary.nvim'
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'nvim-telescope/telescope-scriptrunner.nvim'
...
require'telescope'.load_extension'scriptrunner'
```

## Usage

Set keybinding like `vim.api.nvim_set_keymap('n', '<leader>sr', [[<cmd>lua require'telescope'.extensions.scriptrunner.list{}<CR>]], {noremap=true, silent=true})`
and adapt the options listed below.

### list

`:Telescope scriptrunner list`


| key               | action               |
|-------------------|----------------------|
| `<CR>` run in terminal     | `Floatterm` the found script |
| `<TAB>` | edit the script |

#### options

##### `scriptdir`

Directory containing the scripts

## Credits

Most of the code is directly lifted from [telescope-z](https://github.com/nvim-telescope/telescope-z.nvim).


## TODO

* []  Make todo
