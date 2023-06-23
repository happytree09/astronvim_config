return {
  "olimorris/onedarkpro.nvim",
  as = "onedark",
  priority = 1000, -- Ensure it loads first
  config = function() require("onedarkpro").setup {} end,
}
