-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

wk.add({
  { "<leader>t", group = "tools", icon = { icon = " ", color = "orange" } },

  {
    "<leader>tg",
    function()
      Snacks.terminal.toggle("gemini", {
        -- cwd = vim.fn.expand("%:p:h"),
        win = { border = { "", "", "", " ", "", "", "", " " } },
      })
    end,
    desc = "Gemini CLI",
    mode = { "n", "t" },
    icon = { icon = "✦", color = "yellow" },
  },

  {
    "<leader>td",
    function()
      Snacks.terminal.toggle("lazydocker", {
        -- cwd = vim.fn.expand("%:p:h"),
        win = { border = "none" },
      })
    end,
    desc = "LazyDocker",
    mode = { "n", "t" },
    icon = { icon = " ", color = "blue" },
  },
})
