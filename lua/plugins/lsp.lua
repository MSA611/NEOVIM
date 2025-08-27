return {
  -- Mason for managing LSP servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "tsserver",
        "html",
        "cssls",
        "jsonls",
      },
    },
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
          },
        },
      },
      -- Enable inlay hints
      inlay_hints = {
        enabled = true,
        exclude = { "vue" },
      },
      -- Enable code lenses
      codelens = {
        enabled = false,
      },
      -- Global capabilities
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      -- LSP Server Settings
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
              doc = {
                privateName = { "^_" },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
        pyright = {},
        tsserver = {},
        html = {},
        cssls = {},
        jsonls = {},
      },
    },
    config = function(_, opts)
      -- Setup diagnostics
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      -- Setup diagnostic signs for older Neovim versions
      if vim.fn.has("nvim-0.10.0") == 0 then
        if type(opts.diagnostics.signs) ~= "boolean" then
          for severity, icon in pairs(opts.diagnostics.signs.text) do
            local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
            name = "DiagnosticSign" .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
          end
        end
      end

      -- Setup capabilities
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        has_blink and blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )

      -- Setup LSP attach function
      local function on_attach(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)

        -- Enable inlay hints if supported
        if vim.fn.has("nvim-0.10") == 1 and opts.inlay_hints.enabled then
          if client.supports_method("textDocument/inlayHint") then
            if
              vim.api.nvim_buf_is_valid(bufnr)
              and vim.bo[bufnr].buftype == ""
              and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[bufnr].filetype)
            then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
          end
        end

        -- Enable code lens if supported
        if vim.fn.has("nvim-0.10") == 1 and opts.codelens.enabled and vim.lsp.codelens then
          if client.supports_method("textDocument/codeLens") then
            vim.lsp.codelens.refresh()
            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
              buffer = bufnr,
              callback = vim.lsp.codelens.refresh,
            })
          end
        end
      end

      -- Setup function for each server
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = on_attach,
        }, opts.servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      -- Setup mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      if have_mason then
        mlsp.setup({
          ensure_installed = vim.tbl_keys(opts.servers),
          handlers = { setup },
        })
      end

      -- Setup servers that are not managed by mason
      for server, server_opts in pairs(opts.servers) do
        if server_opts and server_opts.mason == false then
          setup(server)
        end
      end
    end,
  },
}