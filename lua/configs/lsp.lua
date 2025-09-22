-- Modern LSP configuration using vim.lsp.config (Neovim 0.11+)
local function setup_lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- Key mappings
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

-- Check if we have modern vim.lsp.config (Neovim 0.11+)
if vim.lsp.config then
  -- Modern configuration
  vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  }

  vim.lsp.config.pyright = {
    cmd = { "pyright-langserver", "--stdio" },
  }

  vim.lsp.config.tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
  }

  vim.lsp.config.ruff_lsp = {
    cmd = { "ruff-lsp" },
  }

  -- Enable servers
  local servers = { "lua_ls", "pyright", "tsserver", "ruff_lsp" }
  for _, server in ipairs(servers) do
    vim.lsp.enable(server)
  end

  -- Setup keymaps for all LSP buffers
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      setup_lsp_keymaps(args.buf)
    end,
  })

else
  -- Fallback to lspconfig for older Neovim versions
  local lspconfig = require("lspconfig")

  local on_attach = function(client, bufnr)
    setup_lsp_keymaps(bufnr)
  end

  local capabilities = pcall(require, "blink.cmp") and require("blink.cmp").get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

  -- Setup LSP servers
  local servers = { "lua_ls", "pyright", "tsserver", "ruff_lsp" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end

  -- Lua-specific configuration
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  })
end