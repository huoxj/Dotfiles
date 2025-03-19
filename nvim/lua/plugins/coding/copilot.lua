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
      require("copilot").setup(opts)
  end,
}
