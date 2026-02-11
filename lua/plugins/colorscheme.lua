return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false,

  config = function()
    require("gruvbox").setup({
      terminal_colors = true,
      contrast = "hard"        -- or "soft", "medium"
    })

    vim.cmd("colorscheme gruvbox")
  end,
}

--return {
-- https://github.com/rebelot/kanagawa.nvim
--  'rebelot/kanagawa.nvim',
--  "vague-theme/vague.nvim",
-- lazy = false,
--  priority = 1000,
--  opts = {
--    transparent = true, -- ✅ Enable transparent background
--    background = {
--       light = "lotus",
--     -- dark = "dragon", -- "wave, dragon"
--    },
--    colors = {
--      palette = {
--        sumiInk0 = "#161616",
--        sumiInk1 = "#181818",
--        sumiInk2 = "#1a1a1a",
--        sumiInk3 = "#1F1F1F",
--        sumiInk4 = "#2A2A2A",
--        sumiInk5 = "#363636",
--        sumiInk6 = "#545454",
--
--        waveBlue1 = "#322C47",
--        waveBlue2 = "#4c4464",
--
--        winterGreen = "#2B3328",
--        winterYellow = "#49443C",
--        winterRed = "#43242B",
--        winterBlue = "#252535",
--        autumnGreen = "#76A56A",
--        autumnRed = "#C34043",
--        autumnYellow = "#DCA561",
--
--        samuraiRed = "#E82424",
--        roninYellow = "#FF9E3B",
--        waveAqua1 = "#7E9CD8",
--        dragonBlue = "#7FB4CA",
--
--        oldWhite = "#C8C093",
--        fujiWhite = "#F9E7C0",
--        fujiGray = "#727169",
--        oniViolet = "#BFA3E6",
--        oniViolet2 = "#BCACDB",
--        crystalBlue = "#8CABFF",
--        springViolet1 = "#938AA9",
--        springViolet2 = "#9CABCA",
--        springBlue = "#7FC4EF",
--        waveAqua2 = "#77BBDD",
--
--        springGreen = "#98BB6C",
--        boatYellow1 = "#938056",
--        boatYellow2 = "#C0A36E",
--        carpYellow = "#FFEE99",
--
--        sakuraPink = "#D27E99",
--        waveRed = "#E46876",
--        peachRed = "#FF5D62",
--        surimiOrange = "#FFAA44",
--        katanaGray = "#717C7C",
--      },
--    },
--  },
--  config = function(_, opts)
--    require('kanagawa').setup(opts)
--    vim.cmd("colorscheme kanagawa")
--
--    vim.cmd([[
--      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
--      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
--      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
--      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
--    ]])
--
--    vim.cmd([[
--      autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=NONE
--      autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=NONE
--    ]])
--  end
--}
-- Kanagawa Theme (Original)
-- return {
--   -- https://github.com/rebelot/kanagawa.nvim
--   'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     background = {
--       -- light = "lotus",
--       dark = "wave", -- "wave, dragon"
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme kanagawa") -- Replace this with your favorite colorscheme
--   end
-- }

-- Tokyo Night Theme
-- return {
--   -- https://github.com/folke/tokyonight.nvim
--   'folke/tokyonight.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
----     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     style = "night", -- other variations "storm, night, moon, day"
--   },
--   config = function(_, opts)
--     require('tokyonight').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme tokyonight") -- Replace this with your favorite colorscheme
--   end
-- }

-- Catppuccin Theme
-- return {
--    --https://github.com/catppuccin/nvim
--   'catppuccin/nvim',
--   name = "catppuccin", -- name is needed otherwise plugin shows up as "nvim" due to github URI
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--      -- Replace this with your scheme-specific settings or remove to use the defaults
--      transparent = true,
--     flavour = "mocha", -- "latte, frappe, macchiato, mocha"
--   },
--   config = function(_, opts)
--     require('catppuccin').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme catppuccin") -- Replace this with your favorite colorscheme
--   end
-- }

-- Sonokai Theme
-- return {
--   -- https://github.com/sainnhe/sonokai
--  'sainnhe/sonokai',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--  opts = {
--    transparent = true, -- ✅ Enable transparent background
--    background = {
--      -- light = "lotus",
--      dark = "wave", -- "wave, dragon"
--    },
--   config = function(_, opts)
--     vim.g.sonokai_style = "default" -- "default, atlantis, andromeda, shusia, maia, espresso"
--     vim.cmd("colorscheme sonokai") -- Replace this with your favorite colorscheme
--   end
-- }
--}
---- One Nord Theme
---- return {
----   -- https://github.com/rmehri01/onenord.nvim
--   'rmehri01/onenord.nvim',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.cmd("colorscheme onenord") -- Replace this with your favorite colorscheme
--   end
-- }
