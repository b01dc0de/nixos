vim.g.mapleader = ' '

require("lazy").setup({
    rocks = { enabled = false },
    pkgs = { enabled = false },
    install = {
        colorscheme = { "tokyonight" },
        missing = false
    },
    change_detection = { enabled = false },
    spec = {
        --{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { import = "plugins" },
    }
})
