local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap leader key to space
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank to system clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)

-- Paste from system clipboard
keymap({"n", "v"}, "<leader>p", '"+p', opts)

-- Better indent handling (visual mode)
keymap("v", "<", "<gv", opts) -- Indent less, keep visual selection
keymap("v", ">", ">gv", opts) -- Indent more, keep visual selection

-- Move text up and down (visual and select modes)
keymap("v", "J", ":m .+1<CR>==", opts) -- Move line down
keymap("v", "K", ":m .-2<CR>==", opts) -- Move line up
keymap("x", "J", ":move '>+1<CR>gv-gv", opts) -- Move block down (delete mode)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts) -- Move block up (delete mode)

-- Paste preserves primal yanked piece (visual mode)
keymap("v", "p", '"_dP', opts) -- Paste, but don't overwrite yank register

-- Removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts) -- Clear search highlight on Escape

-- General keymaps
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>") -- Toggle Terminal
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>") -- Toggle Breakpoint
keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>") -- Show Hover (documentation)
keymap({"n", "v"}, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>") -- Show Quick Fixes
keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>") -- Show Problems Panel
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>") -- Clear Notifications
keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>") -- Quick Open (File search)
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>") -- Show Command Palette
keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>") -- Run Code (Code Runner extension - assuming it's installed)
keymap({"n", "v"}, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>") -- Format Document

-- Harpoon keymaps
keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>") -- Harpoon: Add Editor
keymap({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>") -- Harpoon: Open Quick Pick
keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>") -- Harpoon: Edit Editors List
keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>") -- Harpoon: Go to Editor 1
keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>") -- Harpoon: Go to Editor 2
keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>") -- Harpoon: Go to Editor 3
keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>") -- Harpoon: Go to Editor 4
keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>") -- Harpoon: Go to Editor 5
keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>") -- Harpoon: Go to Editor 6
keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>") -- Harpoon: Go to Editor 7
keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>") -- Harpoon: Go to Editor 8
keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>") -- Harpoon: Go to Editor 9

-- Project Manager keymaps
keymap({"n", "v"}, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>") -- Project Manager: Save Project
keymap({"n", "v"}, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>") -- Project Manager: Open Projects List (New Window)
keymap({"n", "v"}, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>") -- Project Manager: Edit Projects

-- Personal preference

-- Toggle Side Panel (normal mode)
keymap("n", "<leader>e", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>", opts)

-- Allow arrow keys and Tab to work in VSCode's suggestion dropdown (insert mode), there is also Ctrl+n and Ctrl+p
keymap("i", "<Tab>", "<Nop>", opts)   -- Let VSCode handle Tab for suggestions
keymap("i", "<Up>", "<Nop>", opts)    -- Let VSCode handle Up arrow
keymap("i", "<Down>", "<Nop>", opts)  -- Let VSCode handle Down arrow
keymap("i", "<Left>", "<Nop>", opts)  -- Let VSCode handle Left arrow
keymap("i", "<Right>", "<Nop>", opts) -- Let VSCode handle Right arrow

