return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true
    },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true
                }
            })
        end
    },
    
    ----  I am using Copilot with ghost text so the coplilot-cmp is not needed
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     dependencies = {
    --         {
    --             "zbirenbaum/copilot.lua",
    --             event = "InsertEnter",
    --             config = function()
    --                 require("copilot").setup({
    --                     suggestion = { enabled = false },
    --                     panel = { enabled = false }
    --                 })
    --             end,
    --         }
    --     },
    --     config = true
    -- },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'onsails/lspkind.nvim' }
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                -- if you don't know what is a "source" in nvim-cmp read this:
                -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md#adding-a-source
                sources = {
                    { name = 'path' },
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- default keybindings for nvim-cmp are here:
                -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/README.md#keybindings-1
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    }),
                    ['<Tab>'] = cmp_action.luasnip_supertab(),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                formatting = {
                    format = require('lspkind').cmp_format({
                        fields = { 'abbr', 'kind', 'menu' },
                        preset = 'codicons',
                        mode = 'symbol_text',
                        maxwidth = 50,         -- prevent the popup from showing more than provided characters
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
                        menu = {
                            buffer = '[Buffer]',
                            nvim_lsp = '[LSP]',
                            copilot = '[Copilot]',
                            lunasnip = '[LuaSnip]',
                            path = '[Path]'
                        },
                        symbol_map = {
                            Copilot = "",
                        },
                    })
                },
            })
        end
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        lazy = true,
        config = false
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            local telescope_builtin = require("telescope.builtin")

            lsp_zero.extend_lspconfig()
            ---@diagnostic disable-next-line: unused-local
            lsp_zero.on_attach(function(client, bufnr)
                -- keybindings are listed here:
                -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/README.md#keybindings
                lsp_zero.default_keymaps({ buffer = bufnr })
                vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, { buffer = bufnr })
                vim.keymap.set('n', 'gl', telescope_builtin.diagnostics, { buffer = bufnr })
            end)

            lsp_zero.set_sign_icons({
                error = '✘',
                warn = '▲',
                hint = '⚑',
                info = '»'
            })

            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "terraformls",
                    "pyright",
                    "tsserver",
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,

                }
            })

            local null_ls = require('null-ls')
            local null_opts = lsp_zero.build_options('null-ls', {})

            null_ls.setup({
                on_attach = function(client, bufnr)
                    null_opts.on_attach(client, bufnr)
                end,
                sources = {
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.terraform_validate
                }
            })

            require('mason-null-ls').setup({
                ensure_installed = {
                    "black",
                    "isort",
                },
            })
        end
    },

}
