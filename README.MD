# init.lua
## What you need
- git (for lazy.nvim)
- A C compiler such as gcc (for treesitter)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (for lualine)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for telescope)

### Haskell
Use `ghcup` to install `hls` (do not use Mason!).

`haskell-tools.nvim` is installed but disabled.

## Setup
### Windows
Place these files under `~/AppData/Local/nvim`

### Linux
Place these files under `~/.config/nvim`

## KEYMAPS
- `<lead>` is a single whitespace `'  '`.

| Keymap        | Description                      | Plugin    |
|---------------|----------------------------------|-----------|
| `<leader>a`   | Add file to Harpoon list         | Harpoon   |
| `<C-e>`       | Toggle Harpoon quick menu        | Harpoon   |
| `<C-o>`       | Previous buffer in Harpoon list  | Harpoon   |
| `<C-i>`       | Next buffer in Harpoon list      | Harpoon   |
| `<leader>rn`  | Rename symbol                    | LSP       |
| `<leader>ca`  | Code actions                     | LSP       |
| `<leader>k`   | Open diagnostics at the cursor   | LSP       |
| `<leader>l`   | Open all diagnostics             | LSP       |
| `K`           | Hover documentation              | LSP       |
| `gd`          | Go to definition                 | LSP       |
| `gi`          | Go to implementation             | LSP       |
| `<leader>ff`  | Find files                       | Telescope |
| `<leader>fd`  | Live grep                        | Telescope |
| `<leader>fb`  | Buffers                          | Telescope |
| `<leader>fh`  | Help tags                        | Telescope |
| `<leader>uu`  | Toggle floating file explorer    | NeoTree   |
| `<leader>ui`  | Toggle file explorer on the left | NeoTree   |

## DEFAULT FORMATTERS (ENSURE INSTALLED)
- hlint
- markdownlint
- ormolu
- prettier
- prettierd
- stylua
- typstfmt


