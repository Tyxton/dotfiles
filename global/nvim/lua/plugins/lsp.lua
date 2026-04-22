return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- Programming
                    "basedpyright",
                    "lua_ls",
                    "ts_ls",

                    -- Scripts & Config
                    "bashls",
                    "yamlls",
                    "docker-compose-language-service",
                    "dockerls",
                    "taplo",

                    -- Web Dev
                    "html",
                    "cssls",
                    "marksman",
                },
                    
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = capabilities,
                            settings = { Lua = { diagnostics = { globals = { "vim" } } } }
                        })
                    end,
                },
            })
        end,
        
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = { preset = 'enter' },
            appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
        },
    },
}
