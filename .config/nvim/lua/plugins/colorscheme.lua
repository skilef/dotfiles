return {
    "catppuccin/nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("catppuccin").setup({
            flavout = "frappe",
            transparent_background = true
        })
        vim.cmd([[colorscheme catppuccin]])
    end
}
