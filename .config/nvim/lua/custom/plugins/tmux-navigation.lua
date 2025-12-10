return {
  {
    'aserowy/tmux.nvim',
    init = function()
      return require('tmux').setup()
    end,
  },
}
