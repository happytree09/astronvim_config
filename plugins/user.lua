return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- TODO: Add todo-comments plugin
  -- FIX: sample fix only
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    event = "User AstroFile",
    cmd = { "TodoQuickFix", "TodoTrouble", "TodoTelescope" },
    keys = {
      { "<leader>fq", "<cmd>TodoTelescope keywords=TODO,FIX,NOTE,<cr>", desc = "Open TODOs in Telescope" },
    },
  },
  {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      -- add bread crumbs to the top
      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),

        -- remove the 2nd mode indicator on the right
      }

      -- return the final configuration table
      return opts
    end,
  },
}
