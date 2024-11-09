# init.lua
This setup makes use of lazy.nvim, which means you need `git` installed.
Also, install [Nerd Font](https://www.nerdfonts.com/font-downloads).
By default, this setup uses treesitter so you need a C compiler installed (`gcc` or something else).

### Haskell
Do not use Mason to install hls. Use `ghcup` to install hls. `haskell-tools.nvim` is installed but disabled.

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
| `<leader>fg`  | Live grep                        | Telescope |
| `<leader>fb`  | Buffers                          | Telescope |
| `<leader>fh`  | Help tags                        | Telescope |

