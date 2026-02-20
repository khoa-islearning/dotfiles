return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "clangd",
          "pyright",
          "zls",
          "ts_ls",
          "ast_grep",
          "tailwindcss",
          "somesass_ls",
          "cssls",
        },
        auto_install = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvlsp = require("lspconfig")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
        end,
      })
      require("lspconfig").lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = "LuaJIT",
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  },
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                  -- library = vim.api.nvim_get_runtime_file("", true)
                },
              },
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end,
      })

      -- clangd
      nvlsp.clangd.setup({})
      --pyright
      nvlsp.pyright.setup({})
      --bashls
      nvlsp.bashls.setup({})
      --zls : zig
      nvlsp.zls.setup({})
      nvlsp.ts_ls.setup({})
      nvlsp.tailwindcss.setup({})
      nvlsp.somesass_ls.setup({})
      nvlsp.cssls.setup({})
      local configs = require("lspconfig.configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- NOTE: pedro757/emmet not maintained in a while, might need to replace
      -- npm install -g ls_emmet
      if not configs.ls_emmet then
        configs.ls_emmet = {
          default_config = {
            cmd = { "ls_emmet", "--stdio" },
            filetypes = {
              "html",
              "css",
              "scss",
              "javascriptreact",
              "typescriptreact",
              "haml",
              "xml",
              "xsl",
              "pug",
              "slim",
              "sass",
              "stylus",
              "less",
              "sss",
              "hbs",
              "handlebars",
            },
            root_dir = function(fname)
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end

      nvlsp.ls_emmet.setup({ capabilities = capabilities })
    end,
  },
}
