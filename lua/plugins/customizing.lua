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
              async = false, -- not recommended to change
              quiet = false, -- not recommended to change
              lsp_format = "fallback", -- not recommended to change
            },
            formatters_by_ft = {
              lua = { "stylua" },
              fish = { "fish_indent" },
              sh = { "shfmt" },
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

      }
}