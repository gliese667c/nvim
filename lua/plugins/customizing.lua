-- return {
--   "stevearc/conform.nvim",
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     local conform = require("conform")

--     conform.setup({
--       formatters_by_ft = {
--         swift = { "swiftformat" },
--       },
--       format_on_save = function()
--         return { timeout_ms = 500, lsp_fallback = true }
--       end,
--       log_level = vim.log.levels.ERROR,
--     })

--     vim.keymap.set({ "n", "v" }, "<leader>mp", function()
--       conform.format({
--         lsp_fallback = true,
--         async = false,
--         timeout_ms = 500,
--       })
--     end, { desc = "Format file or range (in visual mode)" })
--   end,
-- }

return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  -- add swift
  {
    "stevearc/conform.nvim",
    opts = function()
      ---@type conform.setupOpts
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
          async = false,           -- not recommended to change
          quiet = false,           -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
          lua = { "stylua" },
          -- fish = { "fish_indent" },
          -- sh = { "shfmt" },
          swift = { "swiftformat" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          -- shfmt = {
          --   prepend_args = { "-i", "2", "-ci" },
          -- },
        },
      }
      return opts
    end,

  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     local lspconfig = require("lspconfig")
  --     local cmp_nvim_lsp = require("cmp_nvim_lsp")
  --     local capabilities = cmp_nvim_lsp.default_capabilities()
  --     -- local opts = { noremap = true, silent = true }
  --     -- local on_attach = function(_, bufnr)
  --     --   opts.buffer = bufnr
  --     --
  --     -- opts.desc = "Show line diagnostics"
  --     -- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  --
  --     -- opts.desc = "Show documentation for what is under cursor"
  --     -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  --     -- end
  --
  --     lspconfig["sourcekit"].setup({
  --       capabilities = capabilities,
  --       -- on_attach = on_attach,
  --       on_init = function(client)
  --         -- HACK: to fix some issues with LSP
  --         -- more details: https://github.com/neovim/neovim/issues/19237#issuecomment-2237037154
  --         client.offset_encoding = "utf-8"
  --       end,
  --     })
  --   end
  -- },
  {
    "mfussenegger/nvim-lint",
    opts = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        swift = { "swiftlint" },
      }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "swift",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    }
  }
}
