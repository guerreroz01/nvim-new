local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then return end

-- First: Set up ts_context_commentstring separately (NEW WAY)
require('ts_context_commentstring').setup({
  enable_autocmd = false, -- Disabled for better performance
  context_commentstring = {
    enable = true,
  }
})

-- Then configure treesitter
ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua"
  },
}

-- NEW WAY: Set up nvim-ts-autotag separately
require('nvim-ts-autotag').setup()

-- Add this for faster loading (recommended by the plugin)
vim.g.skip_ts_context_commentstring_module = true

-- Keep your TSX parser configuration
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
