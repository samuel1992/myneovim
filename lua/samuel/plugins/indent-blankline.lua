return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local indent_blankline = require("ibl")

    indent_blankline.setup({
      enabled = true,
      indent = {
        char = "▏",
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          "NvimTree",
          "packer",
          "Outline",
          "lspinfo",
          "help",
          "dashboard",
          "TelescopePrompt",
          "TelescopeResults",
          "startify",
          "neogitstatus",
          "Trouble",
        },
        buftypes = {
          "terminal",
          "nofile",
        },
      }
    })
  end
}
