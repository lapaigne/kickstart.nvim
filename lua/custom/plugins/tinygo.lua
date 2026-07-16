return {
  'pcolladosoto/tinygo.nvim',
  dependencies = {
    'neovim/nvim-lspconfig', -- Tells Kickstart to attach it directly to gopls
  },
  event = { 'BufReadPre', 'BufNewFile' }, -- Only load when opening files
  config = function()
    require('tinygo').setup {}
  end,
}
