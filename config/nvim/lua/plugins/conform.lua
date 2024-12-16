return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            terraform = { "terraform_fmt" },
            tf = { "terraform_fmt" },
            ["terraform-vars"] = { "terraform_fmt" },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            python = { "isort", "black" },
        }
    },
}
