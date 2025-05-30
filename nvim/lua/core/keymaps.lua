-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

--visual mode move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- save file without auto-formatting
--vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Buffers
--vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", opts)
--vim.keymap.set("n", "<leader><S-Tab>", ":bprevious<CR>", opts)
--vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
--vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
--vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
--vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
--vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
--vim.keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }, opts)
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }, opts)
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }, opts)
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" }, opts)

-- Resize splits using Ctrl + Arrow keys
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true, desc = "Decrease height" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true, desc = "Increase height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true, desc = "Increase width" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
--vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)   -- open new tab
--vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
--vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)     --  go to next tab
--vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
