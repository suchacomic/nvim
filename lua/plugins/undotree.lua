return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  lazy = true,
  config = true,
  keys = {
    {"<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc="Toggle [U]ndotree"} } }
