return {
    {
        "mason-org/mason.nvim",
        config = function ()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup{
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                },
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                signs = false,
                virtual_text = true,
                float = { source = true }
            })

            -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -- Lua
            vim.lsp.enable("lua_ls")
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        diagnostics = { globals = { 'vim' } },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Python
            vim.lsp.enable("pyright")

            -- C
            vim.lsp.enable("clangd")

            -- Rust
            vim.lsp.enable("rust-analyzer")

            -- HTML And CSS
            vim.lsp.enable("html-lsp")
            vim.lsp.enable("emmet-language-server")
            vim.lsp.enable("jinja-lsp")
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- C3
            vim.lsp.enable("c3-lsp")

            -- Configs
            vim.lsp.config("emmet-language-server", {
                filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
                -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                -- **Note:** only the options listed in the table are supported.
                init_options = {
                    ---@type table<string, string>
                    includeLanguages = {},
                    --- @type string[]
                    excludeLanguages = {},
                    --- @type string[]
                    extensionsPath = {},
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                    preferences = {},
                    --- @type boolean Defaults to `true`
                    showAbbreviationSuggestions = true,
                    --- @type "always" | "never" Defaults to `"always"`
                    showExpandedAbbreviation = "always",
                    --- @type boolean Defaults to `false`
                    showSuggestionsAsSnippets = false,
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                    syntaxProfiles = {},
                    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                    variables = {},
                },
            })

            -- Lsp Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
