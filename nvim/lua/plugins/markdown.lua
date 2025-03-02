--[[
  📌 LazyVim: Markdown Preview Plugin (markdown.lua)
  
  🔹 What this file does:
  - Integrates the **Markdown Preview plugin (`iamcco/markdown-preview.nvim`)** with LazyVim.
  - Provides a **live Markdown preview** in the browser while editing `.md` files.
  - Automatically starts the preview when a Markdown file is opened (`vim.g.mkdp_auto_start = 1`).

  🔹 How to use:
  - **Open a Markdown file**: `nvim myfile.md`
  - **Start the live preview**: `:MarkdownPreview`
  - **Stop the preview**: `:MarkdownPreviewStop`
  - **Toggle preview on/off**: `:MarkdownPreviewToggle`
  - **If auto-start is enabled**, the preview will open automatically when you open a `.md` file.

  🔹 Installation:
  - This plugin is managed by LazyVim.
  - It requires **Node.js and yarn/npm** (for `mkdp#util#install()`).
  - If you experience issues, run:
      ```sh
      cd ~/.local/share/nvim/lazy/markdown-preview.nvim && yarn install
      ```
  
  🔹 Notes:
  - If you **don’t want auto-start**, change `vim.g.mkdp_auto_start = 0` in the config below.
  - Supports **custom browser settings** via `vim.g.mkdp_browser = 'firefox'`.
]]
--

return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]() -- Installs the necessary dependencies for Markdown preview
    end,
    ft = { "markdown" }, -- Load this plugin only for Markdown files
    config = function()
      vim.g.mkdp_auto_start = 1 -- Automatically start preview on opening a Markdown file
    end,
  },
}
