return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Define a custom linter for csharpier
    lint.linters.csharpier = {
      name = "csharpier", -- Required field: Name of the linter
      cmd = "csharpier", -- Command to run
      args = { "--check", "$FILENAME" }, -- Arguments to pass to the command
      stream = "stderr", -- Stream to read output from
      severity = "error", -- Severity level of the linter
      parser = function(output) -- Function to parse the output
        local results = {}
        for line in output:gmatch("[^\r\n]+") do
          -- Adjust the parsing logic based on the output format
          local file, message = line:match("^(.*): (.*)$")
          if file and message then
            table.insert(results, {
              row = 1, -- Adjust this to match the actual line number if available
              col = 1,
              message = message,
              severity = "error", -- or "warning" based on your needs
            })
          end
        end
        return results
      end,
    }

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      cs = { "csharpier " },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
