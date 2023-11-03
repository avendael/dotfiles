local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
            init = function()
                -- Disable automatic setup, we are doing it manually
                vim.g.lsp_zero_extend_cmp = 0
                vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },
        {
            'williamboman/mason.nvim',
            lazy = false,
            config = true,
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
            config = function()
                -- Here is where you configure the autocompletion settings.
                local lsp_zero = require('lsp-zero')
                lsp_zero.extend_cmp()

                -- And you can configure cmp even more, if you want to.
                local cmp = require('cmp')
                local cmp_action = lsp_zero.cmp_action()

                cmp.setup({
                    formatting = lsp_zero.cmp_format(),
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-'>"] = cmp.mapping.complete(),
                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    }),
                    sources = {
                        {name = 'nvim_lsp'},
                    },
                })
            end
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
            },
            config = function()
                -- This is where all the LSP shenanigans will live
                local lsp_zero = require('lsp-zero')
                lsp_zero.extend_lspconfig()

                lsp_zero.on_attach(function(client, bufnr)
                    -- see :help lsp-zero-keybindings
                    -- to learn the available actions
                    local opts = { buffer = bufnr, remap = false }
                    local keymap = vim.keymap

                    lsp_zero.default_keymaps({ buffer = bufnr })
                    keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
                    keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
                    keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
                    keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
                    keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
                    keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
                    keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
                    keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
                    keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
                    keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
                end)

                require('mason').setup({})
                require('mason-lspconfig').setup({
                    ensure_installed = {
                        'lua_ls',
                        'pylsp',
                    },
                    handlers = {
                        lsp_zero.default_setup,
                        lua_ls = function()
                            local lua_opts = lsp_zero.nvim_lua_ls()

                            require('lspconfig').lua_ls.setup(
                                lsp_zero.nvim_lua_ls(lua_opts)
                            )
                        end,
                        pylsp = function()
                            require('lspconfig').pylsp.setup {}
                        end,
                    },
                    automatic_installation = true,
                })
            end
        }
    }
}

require("lazy").setup(plugins, opts)
