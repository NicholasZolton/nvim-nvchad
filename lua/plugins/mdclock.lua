return {
  {
    "nicholaszolton/mdclock.nvim",
    -- Local checkout for now; drop `dir` once it's pushed to GitHub.
    dir = "/Users/nicholas/Documents/Projects/mdclock",
    enabled = true,
    cond = not vim.g.vscode,
    cmd = { "ClockIn", "ClockOut", "ClockCancel", "ClockGoto", "ClockEffort", "ClockReport" },
    keys = {
      { "<leader>ci", "<CMD>ClockIn<CR>", desc = "Clock In" },
      { "<leader>co", "<CMD>ClockOut<CR>", desc = "Clock Out" },
      { "<leader>cx", "<CMD>ClockCancel<CR>", desc = "Clock Cancel" },
      { "<leader>cg", "<CMD>ClockGoto<CR>", desc = "Clock Goto" },
      { "<leader>ce", "<CMD>ClockEffort<CR>", desc = "Clock Effort" },
      { "<leader>cr", "<CMD>ClockReport<CR>", desc = "Clock Report" },
    },
    opts = {
      report = {
        kind = "tab",
        scope = "file", -- set to "vault" to aggregate across `root`
        root = vim.fn.expand "~/Documents/Projects/ObsidianVault",
      },
    },
  },
}
