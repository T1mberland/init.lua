# init.lua
This setup makes use of lazy.nvim, which means you need `git` installed.
Also, install [Nerd Font](https://www.nerdfonts.com/font-downloads).

### Haskell
Do not use Mason to install hls. Use `ghcup` to install hls. `haskell-tools.nvim` is installed so you can just use hls out of the boxx

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
| `gd`          | Go to definition                 | LSP       |
| `gi`          | Go to implementation             | LSP       |
| `K`           | Hover documentation              | LSP       |
| `<leader>ff`  | Find files                       | Telescope |
| `<leader>fg`  | Live grep                        | Telescope |
| `<leader>fb`  | Buffers                          | Telescope |
| `<leader>fh`  | Help tags                        | Telescope |

