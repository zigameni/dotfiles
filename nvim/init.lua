-- ============================================================================
--  Neovim Configuration for Both VSCode and AstroVim
--
--  This script ensures that:
--    1. When running inside VSCode Neovim, only VSCode-specific settings are loaded.
--    2. When running in terminal Neovim, AstroVim's lazy.nvim setup is loaded.
--
--  This prevents conflicts between the two environments while keeping them separate.
-- ============================================================================

if vim.g.vscode then
  -- VSCode Neovim configuration
  require "user.vscode_keymaps"
else
  -- AstroVim bootstrapping for terminal Neovim
  local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
    -- Clone lazy.nvim if it's not installed
    vim.fn.system({
      "git", "clone", "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Validate lazy.nvim installation
  if not pcall(require, "lazy") then
    vim.api.nvim_echo({
      { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" },
      { "Press any key to exit...", "MoreMsg" }
    }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end

  -- Load AstroVim configurations
  require "lazy_setup"
  require "polish"
end
