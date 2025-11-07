return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Import the lspconfig module
      local lspconfig = require("lspconfig")

      -- Define your clangd config builder
      local function get_clangd_config()
        local config = {
          cmd = {
            "clangd",
            "--fallback-style=webkit",
          },
          -- Add any other default options you like
          capabilities = vim.lsp.protocol.make_client_capabilities(),
        }

        -- Dynamically modify configuration
        table.insert(config.cmd, "--background-index")
        table.insert(config.cmd, "--header-insertion=never")

        return config
      end

      -- Apply your config into LazyVim’s lsp setup table
      opts.servers = opts.servers or {}
      opts.servers.clangd = get_clangd_config()
    end,
  },
}
