vim.cmd [[packadd nvim-treesitter]]
-- komentarz dziwko
require("nvim-treesitter.configs").setup {
    ensure_installed = { "bash", "c", "lua", "python", "rust", "vim" },
    highlight = { enable = true, },
}
