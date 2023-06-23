-- TODO: Add mappings for the following
-- 1. Between buffers

return {
  -- Normal mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    -- navigate to buffer using shift + right arrow
    ["<S-Right>"] = { ":bn<cr>", desc = "Next buffer" },

    -- navigate to buffer using shift + left arrow
    ["<S-Left>"] = { ":bp<cr>", desc = "Previous buffer" },

    -- move to left splits using shift + up arrow
    ["<S-Up>"] = { "<C-w>h", desc = "Left split" },

    -- move to right splits using shift + down arrow
    ["<S-Down>"] = { "<C-w>l", desc = "Right split" },

    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

    -- undo control z
    ["<C-z>"] = { ":undo<cr>", desc = "Undo" },

    -- paste yank register
    ["<C-v>"] = { '"*p', desc = "Paste" },

    -- go to the end of the line control right arrow
    ["<C-Right>"] = { "$", desc = "End of line" },

    -- go to the beginning of the line control left arrow
    ["<C-Left>"] = { "0", desc = "Beginning of line" },

    -- go to the bottom of the file
    ["<C-Down>"] = { ":$<cr>", desc = "Bottom of file" },

    -- go to the top of the file
    ["<C-Up>"] = { ":0<cr>", desc = "Top of file" },

    -- select all in the file using control a
    ["<C-a>"] = { "ggVG", desc = "Select all" },

    -- go the insert mode space space
    ["<space><space>"] = { "i", desc = "Edit mode" },
  },

  -- Edit mode sample
  i = {
    -- change to from insert mode to normal mode ctrl - q
    ["<C-q>"] = { "<esc>", desc = "Normal mode" },

    -- save using control s
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },

    -- undo control z
    ["<C-z>"] = { "<esc>:undo<cr>", desc = "Undo" },
  },
  -- Visual mode
  v = {
    -- change to from visual mode to normal mode ctrl - q
    ["<C-q>"] = { "<esc>", desc = "Normal mode" },

    -- copy using control c
    ["<C-c>"] = { '"*y', desc = "Copy" },

    -- paste using control v
    ["<C-v>"] = { '"*p', desc = "Paste" },

    -- cut using control x
    ["<C-x>"] = { '"*d', desc = "Cut" },

    -- select all line using control l
    ["<C-l>"] = { "V", desc = "Select all line" },
  },

  -- Terminal mode
  t = {
    -- setting a mapping to false will disable it
    ["<esc>"] = false,
  },
}
