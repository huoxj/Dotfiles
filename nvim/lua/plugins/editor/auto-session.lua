local enable_func = function()
    local enable = true
    -- Disable when leetcode mode
    enable = enable and not (vim.fn.argc() == 1 and vim.fn.argv(0) == 'lc')
    return enable
end

return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    enabled = enable_func(),
    allowed_dirs = { '~/code/*' }
  },
  config = function(_, opts)
      vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
      require('auto-session').setup(opts)
  end,
}
