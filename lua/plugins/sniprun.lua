return {
  {
    "michaelb/sniprun",
    lazy = true,
    build = "bash ./install.sh",
    cmd = { "SnipRun" },
    opts = {
      display = {
        "TempFloatingWindowOk", -- display ok results in the floating window
        "NvimNotifyErr", -- display err results with the nvim-notify plugin
        -- "Classic", -- display results in the command line"
        -- "VirtualText", -- display results in virtual text"
        -- "LongTempFloatingWindow", -- display results in the long floating window
        -- "Terminal" -- display results in a vertical split
        -- "TerminalWithCode" -- display results and code history in a vertical split
      },
      display_options = {
        terminal_width = 45,
        notification_timeout = 5000,
      },
      -- " miscellaneous compatibility/adjustement settings
      inline_messages = 0, -- " inline_message (0/1) is a one-line way to display messages
      -- " to workaround sniprun not being able to display anything
      borders = "single", -- " display borders around floating windows
      -- " possible values are 'none', 'single', 'double', or 'shadow'
    },
    keys = {
      { "<leader>r", "", mode = { "n", "v" }, desc = "+run" },
      {
        "<leader>rr",
        function()
          require("sniprun").run("v")
        end,
        mode = "v",
        desc = "Run code by range",
      },
      {
        "<leader>rr",
        function()
          require("sniprun").run("n")
        end,
        mode = "n",
        desc = "Run code by file",
      },
      {
        "<leader>rc",
        function()
          require("sniprun").clear_repl()
        end,
        mode = "n",
        desc = "Run code: Clear Repl",
      },
      {
        "<leader>rd",
        function()
          require("sniprun.display").close_all()
        end,
        mode = "n",
        desc = "Run code: Close display",
      },
      {
        "<leader>rt",
        function()
          require("sniprun").reset()
        end,
        mode = "n",
        desc = "Run code: Reset",
      },
    },
  },
}
