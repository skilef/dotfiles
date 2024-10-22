return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        format_on_save = { timeout_ms = 500 },
        formatters_by_ft = {
            terraform = { "terraform_fmt" },
            tf = { "terraform_fmt" },
            ["terraform-vars"] = { "terraform_fmt" },
            typescript = { "prettierd" },
        }
    },
}
