local enable_func = function()
    local enable = true
    enable = enable and (not vim.g.leetcode_enabled)
    return enable
end

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<M-CR>",
        accept_word = "<M-'>",
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = false,
      cuda = true,
    },
  },
  config = function(_, opts)
      opts['suggestion']['enabled'] = enable_func()
      require("copilot").setup({})
  end,
}
