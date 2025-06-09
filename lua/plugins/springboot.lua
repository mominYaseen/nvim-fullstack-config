
-- ~/.config/nvim/lua/plugins/springboot.lua
return {
  "nvim-lua/plenary.nvim", -- just a placeholder so Lazy can load this plugin config
  lazy = false,
  config = function()
    vim.api.nvim_create_user_command("SpringBootRun", function()
      require("user.springboot").run()
    end, {})

    vim.api.nvim_create_user_command("SpringBootStop", function()
      require("user.springboot").stop()
    end, {})

    vim.api.nvim_create_user_command("SpringBootToggle", function()
      require("user.springboot").toggle()
    end, {})

    vim.keymap.set("n", "<leader>sr", function()
      require("user.springboot").run()
    end, { desc = "Run Spring Boot" })

    vim.keymap.set("n", "<leader>ss", function()
      require("user.springboot").stop()
    end, { desc = "Stop Spring Boot" })

    vim.keymap.set("n", "<leader>st", function()
      require("user.springboot").toggle()
    end, { desc = "Toggle Spring Boot Terminal" })
  end,
}
