return {

  -- tokyonight
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = { style = 'moon' },
    enabled = false
  },

  -- kanagawa

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    -- priority = 1000,
    enabled = false
  },

  -- Gruvbox Material

  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    -- enabled = false,
    config = function ()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'material'
      -- vim.g.gruvbox_material_transparent_background = '2'
      end
  }
}
