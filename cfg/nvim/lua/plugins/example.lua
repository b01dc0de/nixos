if true then return {} end

return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            auto_install = false,
            ensure_installed = {},
        },
    },

    -- WhichKey
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
            defaults = {
                mode = { "n", "v" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },
}
