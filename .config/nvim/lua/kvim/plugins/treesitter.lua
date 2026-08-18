return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- master is frozen and incompatible with nvim 0.12
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local parsers = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" }
        require("nvim-treesitter").install(parsers)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "lua", "vim", "help", "query", "markdown", "python" },
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
