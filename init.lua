-- bootstrap lazy.nvim, LazyVim and your plugins

if not vim.g.vscode then
  require("config.lazy")
else
  require("config_vscode.lazy")
  require("config_vscode.keymaps")
end
