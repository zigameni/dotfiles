--[[
  📌 LazyVim: Markdown Formatter Configuration (formatter.lua)
  
  🔹 What this file does:
  - Configures **`conform.nvim`**, a powerful code formatting plugin for Neovim.
  - Automatically formats **Markdown (`.md`)** and **Markdown MDX (`.mdx`)** files.
  - Uses **Prettier** (`prettierd` or `prettier`) as the formatter.

  🔹 How to use:
  - **Manually format the current file**: `:Format` - sometimes it might not work. 
  - **Enable auto-format on save**: it is enabled on Save, also use <Leader>cf
  - **Customize formatters**: You can modify this file to change formatters (e.g., `black`, `eslint`, `stylua`).

  🔹 Installation:
  - This plugin is managed by LazyVim.
  - **Requires Prettier** (`prettierd` or `prettier`) installed.
  - Install Prettier globally (if not already installed):
      ```sh
      npm install -g prettier prettierd
      ```

  🔹 Notes:
  - `prettierd` (daemon-based) is **faster** than `prettier`, so it is used first.
  - To use a different formatter, modify the `formatters_by_ft` section.
]]
--

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "prettierd", "prettier" }, -- Format Markdown files with Prettier
        markdown_mdx = { "prettierd", "prettier" }, -- Format Markdown MDX files
      },
    },
  },
}
