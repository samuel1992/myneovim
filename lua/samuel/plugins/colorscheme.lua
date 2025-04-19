-- return {
-- 	"lifepillar/vim-solarized8",
-- 	config = function()
-- 		vim.cmd("colorscheme solarized8_flat")
-- 	end,
-- }

-- "folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},

return {
	"https://gitlab.com/HiPhish/resolarized.nvim",
	lazy = false,
	priority = 1000,
  config = function()
    vim.cmd("colorscheme solarized-dark")
  end,
}

-- return {
--   'maxmx03/solarized.nvim',
--   lazy = false,
--   priority = 1000,
--   ---@type solarized.config
--   opts = {},
--   config = function(_, opts)
--     vim.o.termguicolors = true
--     vim.o.background = 'dark'
--     require('solarized').setup(opts)
--     vim.cmd.colorscheme 'solarized'
--   end,
-- }
