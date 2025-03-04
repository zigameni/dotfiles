-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.lsp.ruff-lsp" },
  -- C/C++ Development
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
  -- import/override with your plugins folder
  -- Color schemes
  { import = "astrocommunity.colorscheme.catppuccin" },
}
