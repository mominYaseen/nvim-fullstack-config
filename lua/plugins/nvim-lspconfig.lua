-- LSP Support
-- return {
--   -- LSP Configuration
--   -- https://github.com/neovim/nvim-lspconfig
--   'neovim/nvim-lspconfig',
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     -- LSP Management
--     -- https://github.com/williamboman/mason.nvim
--     { 'williamboman/mason.nvim' },
--     -- https://github.com/williamboman/mason-lspconfig.nvim
--     { 'williamboman/mason-lspconfig.nvim' },

--     { "antosha417/nvim-lsp-file-operations",      config = true },
--     -- Auto-Install LSPs, linters, formatters, debuggers
--     -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
--     { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

--     -- Useful status updates for LSP
--     -- https://github.com/j-hui/fidget.nvim
--     { 'j-hui/fidget.nvim',                        opts = {} },

--     -- Additional lua configuration, makes nvim stuff amazing!
--     -- https://github.com/folke/neodev.nvim
--     { 'folke/neodev.nvim',                        opts = {} },
--   },
--   config = function()
--     require('mason').setup()
--     require('mason-lspconfig').setup({
--       -- Install these LSPs automatically
--       ensure_installed = {
--         -- Frontend LSPs
--         'html',
--         'cssls',
--         'ts_ls',       -- JavaScript & TypeScript
--         'tailwindcss', -- Tailwind IntelliSense
--         'jsonls',      -- JSON
--         'marksman',    -- Markdown
--         -- Other LSPs
--         'emmet_ls',
--         'lua_ls',
--         'jdtls',
--       }
--     })

--     require('mason-tool-installer').setup({
--       -- Install these linters, formatters, debuggers automatically
--       ensure_installed = {
--         -- Java tools
--         'java-debug-adapter',
--         'java-test',
--         -- Formatters/Linters for frontend
--         'prettier',
--         'eslint_d',
--         'stylelint',
--       },
--     })

--     -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
--     -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
--     vim.api.nvim_command('MasonToolsInstall')

--     local lspconfig = require('lspconfig')
--     local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--     local lsp_attach = function(client, bufnr)
--       -- Create your keybindings here...
--     end

--     -- Call setup on each LSP server
--     require('mason-lspconfig').setup_handlers({
--       function(server_name)
--         -- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
--         if server_name ~= 'jdtls' then
--           lspconfig[server_name].setup({
--             on_attach = lsp_attach,
--             capabilities = lsp_capabilities,
--           })
--         end
--       end
--     })

--     -- Lua LSP settings
--     lspconfig.lua_ls.setup {
--       settings = {
--         Lua = {
--           diagnostics = {
--             -- Get the language server to recognize the `vim` global
--             globals = { 'vim' },
--           },
--         },
--       },
--     }

--     -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
--     local open_floating_preview = vim.lsp.util.open_floating_preview
--     function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--       opts = opts or {}
--       opts.border = opts.border or "rounded" -- Set border to rounded
--       return open_floating_preview(contents, syntax, opts, ...)
--     end
--   end
-- }
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },

--   dependencies = {
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "WhoIsSethDaniel/mason-tool-installer.nvim",
--     "j-hui/fidget.nvim",
--     "folke/neodev.nvim",
--   },

--   config = function()

--     -------------------------
--     -- Mason
--     -------------------------
--     require("mason").setup()

--     -------------------------
--     -- LSP Servers
--     -------------------------
--     local servers = {
--       html = {},
--       cssls = {},
--       jsonls = {},
--       marksman = {},
--       tailwindcss = {},
--       ts_ls = {}, -- JS / TS
--       lua_ls = {
--         settings = {
--           Lua = {
--             diagnostics = {
--               globals = { "vim" },
--             },
--           },
--         },
--       },
--     }

--     -------------------------
--     -- Install Servers
--     -------------------------
--     require("mason-lspconfig").setup({
--       ensure_installed = vim.tbl_keys(servers),
--     })

--     -------------------------
--     -- Install Tools
--     -------------------------
--     require("mason-tool-installer").setup({
--       ensure_installed = {
--         "prettier",
--         "eslint_d",
--         "stylelint",
--         "java-debug-adapter",
--         "java-test",
--       },
--     })

--     -------------------------
--     -- LSP Setup
--     -------------------------
--     local lspconfig = require("lspconfig")
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()

--     local on_attach = function(_, bufnr)

--       local map = function(keys, func)
--         vim.keymap.set("n", keys, func, { buffer = bufnr })
--       end

--       map("gd", vim.lsp.buf.definition)
--       map("gD", vim.lsp.buf.declaration)
--       map("gi", vim.lsp.buf.implementation)
--       map("gr", vim.lsp.buf.references)

--       map("K", vim.lsp.buf.hover)

--       map("<leader>rn", vim.lsp.buf.rename)
--       map("<leader>ca", vim.lsp.buf.code_action)

--       map("<leader>f", function()
--         vim.lsp.buf.format({ async = true })
--       end)

--     end

--     -------------------------
--     -- Setup Servers
--     -------------------------
--     require("mason-lspconfig").setup_handlers({
--       function(server_name)

--         -- jdtls handled separately
--         if server_name == "jdtls" then
--           return
--         end

--         local server = servers[server_name] or {}

--         server.capabilities = capabilities
--         server.on_attach = on_attach

--         lspconfig[server_name].setup(server)

--       end,
--     })

--     -------------------------
--     -- Better floating UI
--     -------------------------
--     local border = "rounded"

--     vim.lsp.handlers["textDocument/hover"] =
--       vim.lsp.with(vim.lsp.handlers.hover, { border = border })

--     vim.lsp.handlers["textDocument/signatureHelp"] =
--       vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

--   end,
-- }
--
--
--
--
--
--
--
--
--
--
--
--
--
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "j-hui/fidget.nvim",
    "folke/neodev.nvim",
  },

  config = function()
    -------------------------
    -- Mason
    -------------------------
    require("mason").setup()

    -------------------------
    -- LSP Servers
    -------------------------
    local servers = {
      html = {},
      cssls = {},
      jsonls = {},
      marksman = {},
      tailwindcss = {},

      ts_ls = {}, -- ✅ correct modern name

      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
    }

    -------------------------
    -- Install LSP Servers
    -------------------------
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    -------------------------
    -- Install External Tools
    -------------------------
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "eslint_d",
        "stylelint",
        "java-debug-adapter",
        "java-test",
      },
    })

    -------------------------
    -- LSP Setup
    -------------------------
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      local map = function(keys, func)
        vim.keymap.set("n", keys, func, { buffer = bufnr })
      end

      -------------------------
      -- Navigation
      -------------------------

      map("gd", vim.lsp.buf.definition)
      map("gD", vim.lsp.buf.declaration)
      map("gi", vim.lsp.buf.implementation)
      map("gr", vim.lsp.buf.references)

      map("K", vim.lsp.buf.hover)

      -------------------------
      -- Refactoring
      -------------------------

      map("<leader>rn", vim.lsp.buf.rename)
      map("<leader>ca", vim.lsp.buf.code_action)

      -------------------------
      -- Formatting
      -------------------------

      map("<leader>f", function()
        vim.lsp.buf.format({
          async = true,
          filter = function(client)
            return client.name ~= "ts_ls"
          end,
        })
      end)
    end

    -------------------------
    -- Setup LSP Servers
    -------------------------
    for server_name, server_config in pairs(servers) do
      if server_name ~= "jdtls" then
        server_config.capabilities = capabilities
        server_config.on_attach = on_attach

        require("lspconfig")[server_name].setup(server_config)
      end
    end

    -------------------------
    -- Floating Window UI
    -------------------------

    local border = "rounded"

    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = border })

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
  end,
}
