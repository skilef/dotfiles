return {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require("catppuccin").setup({
            flavout = "frappe",
            transparent_background = true
        })
        vim.cmd([[colorscheme catppuccin]])
    end
}
