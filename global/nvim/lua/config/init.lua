-- lua/config/init.lua

local opt = vim.opt

-- General Settings
opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Relative line numbers for tactical movement
opt.splitbelow = true       -- Put new windows below
opt.splitright = true       -- Put new windows right
opt.termguicolors = true    -- True color support
opt.shiftwidth = 4          -- Size of an indent
opt.tabstop = 4             -- Number of spaces tabs count for
opt.expandtab = true        -- Use spaces instead of tabs
opt.mouse = "a"             -- Enable mouse support
opt.undofile = true         -- Persistent undo (pairs with undotree)

-- Keymaps
local keymap = vim.keymap.set

-- ### App Shortcuts ###

keymap("n", "<leader>ll", ":Lazy<CR>", { desc = "Open Lazy dashboard" })
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
keymap("n", "<leader>mm", ":Mason<CR>", { desc = "Mason Dashboard" })

-- ### Editor Shortcuts ###

keymap("i", "jk", "<ESC>")
keymap("i", "kj", "<ESC>")

-- Clear search highlights
keymap("n", "<leader>nh", ":nohlsearch<CR>")

-- Quick Saving & Quitting
keymap("n", "<leader>w", ":w<CR>", { desc = "Save File" })
keymap("n", "<leader>fq", ":q<CR>", { desc = "Quit" })

-- ### Navigation ###

-- Buffer Nav
keymap("n", "[b", ":bprev<CR>", { desc = "Previous Buffer" })
keymap("n", "]b", ":bnext<CR>", { desc = "Next Buffer" })

-- Centered Search Movement
keymap("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- ### UI ###

-- Error Investigation
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Inspect Error" })

-- ### GitOps ### 
-- View full Git status (interactive)
keymap("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
-- View Git log/history for this file
keymap("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
-- Blame: See who wrote the line (and when you broke it)
keymap("n", "<leader>gb", function() Snacks.picker.git_blame() end, { desc = "Git Blame" })

-- ### Diagnostics ###
local signs = { Error = "!", Warn = "?", Hint = "󰌵", Info = "󰋼" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = { prefix = '!' },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = { border = 'rounded' },
})
