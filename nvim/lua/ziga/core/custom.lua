vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Search and replace in current line or selection
keymap.set("n", "<leader>rp", function()
  local start_line, end_line

  -- Check if we're in visual mode
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    start_line = vim.fn.line("'<")
    end_line = vim.fn.line("'>")
  else
    -- If not in visual mode, operate on current line
    start_line = vim.fn.line(".")
    end_line = start_line
  end

  -- Prompt for search pattern
  vim.cmd("echohl Question")
  local search = vim.fn.input("Search for: ")
  vim.cmd("echohl None")

  if search == "" then
    return
  end

  -- Prompt for replacement
  vim.cmd("echohl Question")
  local replace = vim.fn.input("Replace with: ")
  vim.cmd("echohl None")

  -- Perform the replacement in the specified range
  local range = start_line .. "," .. end_line
  vim.cmd(range .. "s/" .. vim.fn.escape(search, "/") .. "/" .. vim.fn.escape(replace, "/") .. "/g")
end, { desc = "Replace in current line or selection" })

-- Also add visual mode mapping
keymap.set("v", "<leader>rp", function()
  -- Get the visual selection boundaries
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Exit visual mode to allow for input
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)

  -- Prompt for search pattern
  vim.cmd("echohl Question")
  local search = vim.fn.input("Search for: ")
  vim.cmd("echohl None")

  if search == "" then
    return
  end

  -- Prompt for replacement
  vim.cmd("echohl Question")
  local replace = vim.fn.input("Replace with: ")
  vim.cmd("echohl None")

  -- Perform the replacement in the specified range
  local range = start_line .. "," .. end_line
  vim.cmd(range .. "s/" .. vim.fn.escape(search, "/") .. "/" .. vim.fn.escape(replace, "/") .. "/g")
end, { desc = "Replace in visual selection" })
