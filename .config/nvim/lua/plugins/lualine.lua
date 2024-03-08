return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons","AndreM222/copilot-lualine" },
        config = function()
            local lualine = require("lualine")
            local lazy_status = require("lazy.status") -- to configure lazy pending updates count
            lualine.setup({
                options = {
                    icons_enabled = true,
                    theme = "catppuccin",
                },
                sections = {
                    lualine_x = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#ff9e64" },
                        },
                        { "copilot" },
                        -- { "encoding" },
                        -- { "fileformat" },
                        { "filetype" },
                    }
                }
            })
        end
    }
}
