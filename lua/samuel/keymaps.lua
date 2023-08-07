local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

---- Normal ----
-- Nvim-tree luav
keymap("n", "<Leader>e", ":NvimTreeToggle<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows TODO: maybe come up with something without using the arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Create new window splits easy
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "vv", ":vsplit<CR>", opts)

-- Create new terminal window splits
keymap("n", "tss", ":new<CR>:terminal<CR>", opts)
keymap("n", "tvv", ":vnew<CR>:terminal<CR>", opts)

-- Remove highlight from searched word
keymap("n", "//", ":noh<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<Leader>qq", ":bd<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Copy and paste with X support
keymap("n", "<Leader>y", '"+y', opts)
keymap("n", "<Leader>p", '"+p', opts)

-- Telescope
keymap("n", "<Leader>f", ":Telescope find_files previewer=false theme=get_dropdown<cr>", opts)
keymap("n", "<Leader>F", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<Leader>b", ":Telescope buffers theme=ivy<cr>", opts)
keymap("n", "<Leader>g", ":Telescope live_grep<cr>", opts)
keymap("n", "<Leader>G", ":Telescope grep_string<cr>", opts)
keymap("n", "<Leader>h", ":Telescope oldfiles<cr>", opts)
keymap("n", "<Leader>m", ":Telescope marks bufnr=0<cr>", opts)
keymap("n", "<Leader>s", ":Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<Leader>d", ":Telescope lsp_definitions<cr>", opts)
keymap("n", "<Leader>r", ":Telescope lsp_references<cr>", opts)

---- Visual ----
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)


---- Visual Block ----
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

---- Terminal ----
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
