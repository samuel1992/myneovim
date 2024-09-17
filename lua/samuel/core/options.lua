local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 0, -- space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	pumheight = 10, -- pop up menu height
	showmode = true, -- see things like -- INSERT -- anymore
	showtabline = 1, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	-- timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 2, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	tags = "tags", -- my ctags filename
	hidden = false,
	colorcolumn = "100",
	mouse = "",
	-- TODO: display extra whitespace, tab, trail, nbsp
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Initial configuration for Explore
vim.g.netrw_winsize = 17
vim.g.netrw_banner = 0 -- disable annoying banner
vim.g.netrw_altv = 1 -- open splits to the right
vim.g.netrw_liststyle = 3 -- tree view

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
	callback = function()
		local lint_status, lint = pcall(require, "lint")
		if lint_status then
			lint.try_lint()
		end
	end,
})

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set path+=**")
vim.cmd("set wildignore+=*pyc,.git/**,node_modules/**,python-virtualenv/**,.venv/**")
vim.cmd([[set iskeyword+=-]])
vim.cmd("ca Explore :silent Explore")
-- vim.cmd("ca Lint :lua require('lint').try_lint()")
vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted

    autocmd FileType ruby setlocal indentkeys-=.
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _python
    autocmd!
    autocmd BufNewFile,BufRead *.py set colorcolumn=88
  augroup end

  augroup _jinja2
    autocmd!
    autocmd BufNewFile,BufRead *.jinja2 set syntax=django
  augroup end

  augroup _go
    autocmd!
    autocmd BufWritePre *.go lua require("conform").format({lsp_fallback=true,async=false,timeout_ms=2000})
  augroup end
]])
