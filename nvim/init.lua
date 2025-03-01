if vim.g.vscode then
  -- VSCode Neovim
  require "user.vscode_keymaps"
else
  -- Add terminal Neovim config here (optional)
  require("config.lazy")
end