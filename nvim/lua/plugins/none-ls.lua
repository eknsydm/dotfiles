return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- Formatters & linters for mason to install
        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier", -- ts/js formatter
                "stylua", -- lua formatter
                "shfmt", -- Shell formatter
                --				"checkmake", -- linter for Makefiles
                "clangd",
            },
            automatic_installation = true,
        })

        local sources = {
            --diagnostics.checkmake,
            formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
            formatting.stylua,
            formatting.clang_format.with({
                args = function()
                    local shiftwidth = vim.bo.shiftwidth
                    local expandtab = vim.bo.expandtab

                    -- Build the style string
                    local style = "BasedOnStyle: llvm, IndentWidth: " .. shiftwidth .. ", TabWidth: " .. shiftwidth

                    if expandtab then
                        style = style .. ", UseTab: Never"
                    else
                        style = style .. ", UseTab: Always"
                    end

                    return { "--style={" .. style .. "}" }
                end,
            }),
            formatting.shfmt.with({ args = { "-i", "4" } }),
            formatting.terraform_fmt,
            require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
            require("none-ls.formatting.ruff_format"),
        }

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
            sources = sources,
            -- you can reuse a shared lspconfig on_attach callback here
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    --vim.api.nvim_buf_set_keymap(
                    --    bufnr,
                    --    "n",
                    --    "<leader>mp",
                    --   "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
                    --    { noremap = true, silent = true, { desc = "Format File" } }
                    --)
                    vim.keymap.set("n", "<leader>mp", function()
                        vim.lsp.buf.format({ async = false })
                    end, { desc = "Format File", noremap = true, silent = true, buffer = bufnr })
                    --vim.api.nvim_create_autocmd("BufWritePre", {
                    --    group = augroup,
                    --    buffer = bufnr,
                    --    callback = function()
                    --       vim.lsp.buf.format({ async = false })
                    --    end,
                    --})
                end
            end,
        })
    end,
}
