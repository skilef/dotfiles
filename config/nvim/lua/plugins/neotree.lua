return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim"
    },
    opts = function(_, _)
        vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { silent = true, desc = "Toggle file tree" })
        return {
            window = {
                position = "current",
            }
        }
    end
}

