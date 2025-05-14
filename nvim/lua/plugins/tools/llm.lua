return {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
      { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler Explain these code in Chinese<cr>" },
      { "<leader>at", mode = "x", "<cmd>LLMSelectedTextHandler Translate to Chinese<cr>" },
    },
    config = function()
        require("llm").setup({
            url = "https://cnapi.kksj.org/v1/chat/completions",
            model = "gpt-4o",
            api_type = "openai",
            max_tokens = 4096,
            temperature = 0.3,
            top_p = 0.7,
            -- fetch_key = function()
            --     return vim.env.LLM_KEY
            -- end,

            -- args = [[return {url, "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],

            prompt = "I want you to act as a knowledgeable software development mentor, specifically teaching an undergraduate but skilled student major in software engineering. Respond as brief as possible. Explain complex coding concepts in a simple and clear way. Provide most advanced and useful knowledge briefly(do not provide useless tips! you can ignore this if the knowledge is not cool), espicially best practices in practical.If user makes any mistake, you can correct it bravely. Do not use markdown in response, organize response in a commandline-friendly way",
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
