return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            auto_trigger = true
        },
        filetypes = {
            yaml = true,
            markdown = true
        }
    },
}
