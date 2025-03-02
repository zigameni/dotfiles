--[[
  📌 LazyVim: Disable Copy on Delete (nokillcopy.lua)
  
  🔹 What this file does:
  - By default, Vim and LazyVim **copy deleted text** into the unnamed register.
  - This means when you delete (`d`), change (`c`), or cut (`x`), it **overwrites your clipboard**.
  - This file **remaps** those commands to use the **black hole register (`"_`)** instead.
  - Now, **only `y` (yank) copies text**, while deletions won’t affect your clipboard.

  🔹 How to use:
  - **Delete without copying**: `d`, `D`
  - **Change without copying**: `c`, `C`
  - **Cut without copying**: `x`
  - **Copy normally**: `y`
  - **Paste normally**: `p`, `P`
  
  🔹 Installation:
  - Place this file in `~/.config/nvim/lua/plugins/nokillcopy.lua`
  - Run `:Lazy sync` in Neovim to apply changes.

  🔹 Note:
  - If you ever want to **temporarily copy while deleting**, use `"dd` or `"d2w`.
]]
--

return {
  {
    "LazyVim/LazyVim",
    opts = {
      keys = {
        { "d", '"_d', mode = { "n", "v" } }, -- Delete without copying
        { "D", '"_D', mode = { "n", "v" } }, -- Same for `D`
        { "c", '"_c', mode = { "n", "v" } }, -- Change without copying
        { "C", '"_C', mode = { "n", "v" } }, -- Same for `C`
        { "x", '"_x', mode = { "n", "v" } }, -- Cut without copying
      },
    },
  },
}
