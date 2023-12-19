return {
{
    'miikanissi/modus-themes.nvim',
    config =function ()
        -- Default options
        require("modus-themes").setup({
            -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
            -- `auto` will automatically set style based on background set with vim.o.background
            style = "modus_operandi",
            variant = "tinted", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = false },
                functions = { italic = false },
                variables = { italic = false },
            },

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            --- param colors ColorScheme
            on_colors = function(colors) end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---param highlights Highlights
            ---param colors ColorScheme
            on_highlights = function(highlights, colors) end,
        })
    end
},
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
      require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})
  end
},
{ 
    "catppuccin/nvim", 
    name = "catppuccin",
    priority = 1000,
    config = function ()
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

    end
},

{'overcache/NeoSolarized'},
{'rose-pine/neovim', name = 'rose-pine'},
{'EdenEast/nightfox.nvim'},
{'sainnhe/edge'},
{'folke/tokyonight.nvim'},
{'shaunsingh/nord.nvim'},
{'NLKNguyen/papercolor-theme'},
{"savq/melange-nvim"},
 {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      -- ...
    })
  end,
},
{'d00h/nvim-rusticated'},
{
    "mcchrish/zenbones.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim"
},
{"sainnhe/everforest"},
{
    "yorik1984/newpaper.nvim",
    priority = 1000,
    config = true,
},
{"protesilaos/tempus-themes-vim"},
{"lifepillar/vim-solarized8"},
{"romainl/flattened"},
{"yorickpeterse/vim-paper"},
{"sonph/onehalf"},
--{
--    "xolox/vim-colorscheme-switcher",
--    config = function()
--        --vim.g.colorscheme_switcher_exclude = {  'NeoSolarized', 'flattened_dark', --[['modus',]] 'rosebones', 'tempus_tempest', --[['PaperColor',]] 'flattened_light', --[['modus_operandi',]] 'rusticated', 'tempus_totus', 'blue', 'forestbones', 'modus_vivendi', 'seoulbones', 'tempus_warp', 'carbonfox', 'github_dark', 'morning', 'shine', 'tempus_winter', 'catppuccin', 'github_dark_colorblind', 'murphy', 'slate', 'terafox', 'catppuccin-frappe', 'github_dark_default', 'neobones', 'solarized9', 'tokyobones', --[['catppuccin-latte',]] 'github_dark_dimmed', --[['newpaper',]] 'solarized9_flat', 'tokyonight', 'catppuccin-macchiato', 'github_dark_high_contrast', 'nightfox', --[['solarized8_high',]] --[['tokyonight-day',]] 'catppuccin-mocha', 'github_dark_tritanopia', 'nord', 'solarized9_low', 'tokyonight-moon', 'darkblue', 'github_dimmed', 'nordbones', 'tempus_autumn', 'tokyonight-night', --[['dawnfox',]] 'github_light', 'nordfox', 'tempus_classic', 'tokyonight-storm', --[['dayfox',]] 'github_light_colorblind', 'pablo', 'tempus_dawn', 'torte', 'default','github_light_default', 'paper', 'tempus_day', 'vimbones', 'delek', 'github_light_high_contrast', --[['peachpuff',]] 'tempus_dusk', 'zellner', 'desert','github_light_tritanopia', 'quiet', 'tempus_fugit', --[['zenbones',]] 'duckbones', 'habamax', 'randombones', 'tempus_future', 'zenburned', 'duskfox ','industry', 'ron', 'tempus_night', 'zenwritten', --[['edge',]] 'kanagawabones', 'rose-pine', 'tempus_past', 'elflord', 'koehler', --[['rose-pine-dawn',]] 'tempus_rift', 'evening', 'lunaperche', 'rose-pine-main', 'tempus_spring', --[['everforest',]] --[['melange',]] 'rose-pine-moon', 'tempus_summer'}
--    end,
--    dependencies = {
--        {"xolox/vim-misc"},
--    },
--},
--{
--    "Taverius/vim-colorscheme-manager",
--    dependencies = {"xolox/vim-colorscheme-switcher"},
--    config = function ()
--        
--    end,
--},
}
