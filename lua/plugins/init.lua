return {
  -- Appearance
  { "nvim-tree/nvim-tree.lua", opts = {} },
  { "nvim-tree/nvim-web-devicons" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "https://gitlab.com/HiPhish/resolarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme solarized-dark")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "python", "go", "elixir", "heex", "javascript", "tsx", "html",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.gopls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.elixirls.setup({
        cmd = { "elixir-ls" }
      })

    end
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end
  },

  -- Git
  { "lewis6991/gitsigns.nvim", opts = {} },
}
