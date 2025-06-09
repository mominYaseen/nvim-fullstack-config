
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup()

    wk.register({
      ["<leader>w"] = { name = "+write/save" },
      ["<leader>q"] = { name = "+quit" },
      ["<leader>s"] = { name = "+split/resize" },
      ["<leader>t"] = { name = "+tabs/tests" },
      ["<leader>f"] = { name = "+find/telescope" },
      ["<leader>g"] = { name = "+git/lsp" },
      ["<leader>h"] = { name = "+harpoon" },
      ["<leader>d"] = { name = "+debug" },
      ["<leader>j"] = { name = "+java" },
      ["<leader>x"] = { name = "+REST" },
      ["<leader>e"] = { name = "+explorer" },
      ["<leader>c"] = { name = "+conflict/diff" },
    })
  end,
}
