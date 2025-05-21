return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
        local keymap = vim.keymap.set

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }

                -- these will be buffer-local keybindings
                -- because they only work if you have an active language server

                keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                keymap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                keymap({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                keymap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end
        })
    end
}
