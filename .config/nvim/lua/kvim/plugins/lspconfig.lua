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
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 4,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
          vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
        end,
      })

      -- Only lua_ls needs overrides; the rest use nvim-lspconfig's shipped lsp/ defaults.
      -- Settings are injected at init unless the project pins its own .luarc.json.
      vim.lsp.config("lua_ls", {
        on_init = function(client)
          local folder = client.workspace_folders and client.workspace_folders[1]
          if folder then
            local path = folder.name
            if not vim.uv.fs_stat(path .. "/.luarc.json") and not vim.uv.fs_stat(path .. "/.luarc.jsonc") then
              client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME },
                  },
                },
              })
              client:notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
          end
          return true
        end,
      })

      -- Not shipped by nvim-lspconfig, so the whole config lives here.
      -- Requires `npm install -g ls_emmet` (pedro757/emmet). Installed per-node-version
      -- under ~/.nvm, so it leaves PATH if you switch node.
      vim.lsp.config("ls_emmet", {
        cmd = { "ls_emmet", "--stdio" },
        filetypes = {
          "html",
          "css",
          "scss",
          "sass",
          "less",
          "sss",
          "stylus",
          "javascriptreact",
          "typescriptreact",
          "haml",
          "xml",
          "xsl",
          "pug",
          "slim",
          "hbs",
          "handlebars",
        },
        -- Emmet is context-free, so attach at cwd rather than hunting a project root.
        root_dir = function(_, on_dir)
          on_dir(vim.fn.getcwd())
        end,
        settings = {},
      })

      vim.lsp.enable({
        "lua_ls",
        "clangd",
        "pyright",
        "bashls",
        "zls",
        "ts_ls",
        "tailwindcss",
        "somesass_ls",
        "cssls",
        "ls_emmet",
      })
    end,
  },
}
