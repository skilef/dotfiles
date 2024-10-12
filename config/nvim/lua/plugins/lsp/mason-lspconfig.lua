return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp'
    },
    opts = function(_, _)
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        return {
            ensure_installed = { "lua_ls", "html" },
            automatic_installation = false,
            handlers = {
                function(server)
                    require('lspconfig')[server].setup({
                        capabilities = lsp_capabilities,
                    })
                end
            },
        }
    end
}
