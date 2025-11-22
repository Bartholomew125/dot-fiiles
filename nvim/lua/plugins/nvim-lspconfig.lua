return {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 
            'mason-org/mason.nvim', 
            opts = {} 
        },

        'mason-org/mason-lspconfig.nvim',

        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        { 
            'j-hui/fidget.nvim', 
            opts = {} 
        },
    },

    config = function()
        require('mason-lspconfig').setup {
            ensure_installed = { "jdtls" }, 
            automatic_installation = false
        }
    end,
}
