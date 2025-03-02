local leet_arg = "lc"

-- Get highlight group value by name
local function hl(name)
    local highlight = vim.api.nvim_get_hl(0, { name = name, link = false })
    setmetatable(highlight, {
        __index = function(self, key)
            if key == "bg" then
                return self.background
            end
            if key == "fg" then
                return self.foreground
            end

            return nil
        end,
    })

    return highlight
end

return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    lazy = leet_arg ~= vim.fn.argv(0, -1),
    opts = {
        arg = leet_arg,
        lang = "cpp",
        cn = {
            enabled = true,
        },
        storage = {
            home = vim.fn.stdpath("data") .. "/leetcode",
            cache = vim.fn.stdpath("cache") .. "/leetcode",
        },
        injector = {
            ["cpp"] = {
                before = { "#include <bits/stdc++.h>" },
                after = {
                    "int main(){",
                    "    auto s = Solution();",
                    "    ",
                    "}",
                },
            }, 
        },
        picker = { provider = "telescope" },
        theme = {
            ['normal'] = { fg = hl("Normal").fg }
        }
    },
    config = function(_, opts)
        vim.g.leetcode_enabled = true
        require("leetcode").setup(opts)
    end,
}
