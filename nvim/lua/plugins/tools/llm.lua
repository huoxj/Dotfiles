return {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
      { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
      { "<leader>at", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
    },
    config = function()
        require("llm").setup({
            url = "https://api.kksi.org/v1/chat/completions",
            model = "deepseek-r1",
            api_type = "openai",
            max_tokens = 2048,
            temperature = 0.3,
            top_p = 0.7,

            args = [[return {url, "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],

            prompt = "I want you to act as a Chinese knowledgeable software development mentor, specifically teaching a junior developer. Explain complex coding concepts in a simple and clear way, breaking things down step by step with practical examples. Use analogies and practical advice to ensure understanding. Anticipate common mistakes and provide tips to avoid them.",
            prefix = {
                user = { text = "🫡 ", hl = "Title" },
                assistant = { text = "  ", hl = "Added" },
            },

            save_session = true,
            max_history = 15,
            max_history_name_length = 20,

            keys = {
                -- The keyboard mapping for the input window.
                ["Input:Submit"]      = { mode = "n", key = "<cr>" },
                ["Input:Cancel"]      = { mode = {"n", "i"}, key = "<C-c>" },
                ["Input:Resend"]      = { mode = {"n", "i"}, key = "<C-r>" },

                -- only works when "save_session = true"
                ["Input:HistoryNext"] = { mode = {"n", "i"}, key = "<C-j>" },
                ["Input:HistoryPrev"] = { mode = {"n", "i"}, key = "<C-k>" },

                -- The keyboard mapping for the output window in "split" style.
                ["Output:Ask"]        = { mode = "n", key = "i" },
                ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
                ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

                -- The keyboard mapping for the output and input windows in "float" style.
                ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
                ["Session:Close"]     = { mode = "n", key = {"<esc>", "Q"} },
            },
        })
    end
}
