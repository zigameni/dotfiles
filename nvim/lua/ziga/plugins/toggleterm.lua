-- used for the terminal
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<M-`>]], -- Use Alt + ` to toggle the terminal
      shade_terminals = true,
      direction = "float", -- Options: "horizontal", "vertical", "tab", "float"
      close_on_exit = true,
      shell = vim.o.shell,
    })

    desc = "Toggle floating terminal"
    -- Keybind for Ctrl + ` (if supported)
    vim.keymap.set("n", "<C-`>", "<cmd>ToggleTerm direction=float<CR>", {
      noremap = true,
      silent = true,
      desc = desc,
    })
  end,
}
