-- Markdown Preview Plugin for LazyVim
-- This plugin provides a live Markdown preview in the browser.
-- It automatically starts the preview when opening a Markdown file.

-- Usage:
-- - Open a Markdown file in Neovim (`nvim myfile.md`).
-- - Run `:MarkdownPreview` to start the preview in your web browser.
-- - Run `:MarkdownPreviewStop` to stop the preview.
-- - If auto-start is enabled (`vim.g.mkdp_auto_start = 1`), it will start automatically.

return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
}
